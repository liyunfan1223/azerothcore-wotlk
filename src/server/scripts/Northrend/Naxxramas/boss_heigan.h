#ifndef BOSS_HEIGAN_H_
#define BOSS_HEIGAN_H_

#include "Player.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "SpellInfo.h"
#include "naxxramas.h"

namespace Heigan {

enum Says
{
    SAY_AGGRO                       = 0,
    SAY_SLAY                        = 1,
    SAY_TAUNT                       = 2,
    EMOTE_DEATH                     = 3,
    EMOTE_DANCE                     = 4,
    EMOTE_DANCE_END                 = 5,
    SAY_DANCE                       = 6
};

enum Spells
{
    SPELL_SPELL_DISRUPTION          = 29310,
    SPELL_DECREPIT_FEVER_10         = 29998,
    SPELL_DECREPIT_FEVER_25         = 55011,
    SPELL_PLAGUE_CLOUD              = 29350,
    SPELL_TELEPORT_SELF             = 30211
};

enum Events
{
    EVENT_DISRUPTION                = 1,
    EVENT_DECEPIT_FEVER             = 2,
    EVENT_ERUPT_SECTION             = 3,
    EVENT_SWITCH_PHASE              = 4,
    EVENT_SAFETY_DANCE              = 5,
    EVENT_PLAGUE_CLOUD              = 6
};

enum Misc
{
    PHASE_SLOW_DANCE                = 0,
    PHASE_FAST_DANCE                = 1
};

class boss_heigan : public CreatureScript
{
public:
    boss_heigan() : CreatureScript("boss_heigan") { }

    CreatureAI* GetAI(Creature* pCreature) const override
    {
        return GetNaxxramasAI<boss_heiganAI>(pCreature);
    }

    struct boss_heiganAI : public BossAI
    {
        explicit boss_heiganAI(Creature* c) : BossAI(c, BOSS_HEIGAN)
        {}

        EventMap events;
        uint8 currentPhase{};
        uint8 currentSection{};
        bool moveRight{};

        void Reset() override
        {
            BossAI::Reset();
            events.Reset();
            currentPhase = 0;
            currentSection = 3;
            moveRight = true;
        }

        void KilledUnit(Unit* who) override
        {
            if (!who->IsPlayer())
                return;

            Talk(SAY_SLAY);
            instance->StorePersistentData(PERSISTENT_DATA_IMMORTAL_FAIL, 1);
        }

        void JustDied(Unit*  killer) override
        {
            BossAI::JustDied(killer);
            Talk(EMOTE_DEATH);
        }

        void JustEngagedWith(Unit* who) override
        {
            BossAI::JustEngagedWith(who);
            me->SetInCombatWithZone();
            Talk(SAY_AGGRO);
            StartFightPhase(PHASE_SLOW_DANCE);
        }

        void StartFightPhase(uint8 phase)
        {
            currentSection = 3;
            currentPhase = phase;
            events.Reset();
            if (phase == PHASE_SLOW_DANCE)
            {
                me->CastStop();
                me->SetReactState(REACT_AGGRESSIVE);
                DoZoneInCombat();
                events.ScheduleEvent(EVENT_DISRUPTION, 12s, 15s);
                events.ScheduleEvent(EVENT_DECEPIT_FEVER, 17s);
                events.ScheduleEvent(EVENT_ERUPT_SECTION, 15s);
                events.ScheduleEvent(EVENT_SWITCH_PHASE, 90s);
            }
            else // if (phase == PHASE_FAST_DANCE)
            {
                Talk(EMOTE_DANCE);
                Talk(SAY_DANCE);
                me->AttackStop();
                me->StopMoving();
                me->SetReactState(REACT_PASSIVE);
                me->CastSpell(me, SPELL_TELEPORT_SELF, false);
                me->SetFacingTo(2.40f);
                events.ScheduleEvent(EVENT_PLAGUE_CLOUD, 1s);
                events.ScheduleEvent(EVENT_ERUPT_SECTION, 7s);
                events.ScheduleEvent(EVENT_SWITCH_PHASE, 45s);
            }
            events.ScheduleEvent(EVENT_SAFETY_DANCE, 5s);
        }

        bool IsInRoom(Unit* who)
        {
            if (who->GetPositionX() > 2826 || who->GetPositionX() < 2723 || who->GetPositionY() > -3641 || who->GetPositionY() < -3736)
            {
                if (who->GetGUID() == me->GetGUID())
                    EnterEvadeMode();

                return false;
            }
            return true;
        }

        void UpdateAI(uint32 diff) override
        {
            if (!IsInRoom(me))
                return;

            if (!UpdateVictim())
                return;

            events.Update(diff);

            switch (events.ExecuteEvent())
            {
                case EVENT_DISRUPTION:
                    me->CastSpell(me, SPELL_SPELL_DISRUPTION, false);
                    events.Repeat(10s);
                    break;
                case EVENT_DECEPIT_FEVER:
                    me->CastSpell(me, RAID_MODE(SPELL_DECREPIT_FEVER_10, SPELL_DECREPIT_FEVER_25), false);
                    events.Repeat(22s, 25s);
                    break;
                case EVENT_PLAGUE_CLOUD:
                    me->CastSpell(me, SPELL_PLAGUE_CLOUD, false);
                    break;
                case EVENT_SWITCH_PHASE:
                    if (currentPhase == PHASE_SLOW_DANCE)
                    {
                        StartFightPhase(PHASE_FAST_DANCE);
                    }
                    else
                    {
                        StartFightPhase(PHASE_SLOW_DANCE);
                        Talk(EMOTE_DANCE_END); // avoid play the emote on aggro
                    }
                    break;
                case EVENT_ERUPT_SECTION:
                {
                    instance->SetData(DATA_HEIGAN_ERUPTION, currentSection);
                    if (currentSection == 3)
                        moveRight = false;
                    else if (currentSection == 0)
                        moveRight = true;

                    moveRight ? currentSection++ : currentSection--;

                    if (currentPhase == PHASE_SLOW_DANCE)
                        Talk(SAY_TAUNT);

                    events.Repeat(currentPhase == PHASE_SLOW_DANCE ? 10s : 4s);
                    break;
                }
                case EVENT_SAFETY_DANCE:
                {
                    Map::PlayerList const& pList = me->GetMap()->GetPlayers();
                    for (auto const& itr : pList)
                    {
                        if (IsInRoom(itr.GetSource()) && !itr.GetSource()->IsAlive())
                        {
                            instance->SetData(DATA_DANCE_FAIL, 0);
                            instance->StorePersistentData(PERSISTENT_DATA_IMMORTAL_FAIL, 1);
                            return;
                        }
                    }
                    events.Repeat(5s);
                    return;
                }
            }

            DoMeleeAttackIfReady();
        }
    };
};

}
#endif