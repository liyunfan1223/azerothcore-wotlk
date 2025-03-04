/*
 * This file is part of the AzerothCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Affero General Public License as published by the
 * Free Software Foundation; either version 3 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "CreatureScript.h"
#include "ScriptedCreature.h"
#include "naxxramas.h"


            switch (events.ExecuteEvent())
            {
                // GROUND
            case EVENT_CURSE:
                if (events.GetPhaseMask() == 0)
                {
                    me->CastCustomSpell(RAID_MODE(SPELL_CURSE_OF_THE_PLAGUEBRINGER_10, SPELL_CURSE_OF_THE_PLAGUEBRINGER_25), SPELLVALUE_MAX_TARGETS, RAID_MODE(3, 10), me, false);
                }
                events.Repeat(25s);
                break;
            case EVENT_SUMMON_PLAGUED_WARRIOR_ANNOUNCE:
                Talk(SAY_SUMMON);
                Talk(EMOTE_SUMMON);
                events.Repeat(30s);
                events.ScheduleEvent(EVENT_SUMMON_PLAGUED_WARRIOR_REAL, 4s);
                break;
            case EVENT_SUMMON_PLAGUED_WARRIOR_REAL:
                me->CastSpell(me, SPELL_SUMMON_PLAGUED_WARRIORS, true);
                SummonHelper(NPC_PLAGUED_WARRIOR, RAID_MODE(2, 3));
                break;
            case EVENT_MOVE_TO_BALCONY:
                Talk(EMOTE_TELEPORT_BALCONY);
                me->CastSpell(me, SPELL_TELEPORT, true);
                StartBalconyPhase();
                break;
            case EVENT_BLINK:
                DoResetThreatList();
                me->CastSpell(me, RAID_MODE(SPELL_CRIPPLE_10, SPELL_CRIPPLE_25), false);
                me->CastSpell(me, SPELL_BLINK, true);
                Talk(EMOTE_BLINK);
                events.Repeat(30s);
                break;
                // BALCONY
            case EVENT_BALCONY_SUMMON_ANNOUNCE:
                Talk(EMOTE_SUMMON_WAVE);
                events.Repeat(30s);
                events.ScheduleEvent(EVENT_BALCONY_SUMMON_REAL, 4s);
                break;
            case EVENT_BALCONY_SUMMON_REAL:
                me->CastSpell(me, SPELL_SUMMON_PLAGUED_WARRIORS, true); // visual
                switch (timesInBalcony)
                {
                case 0:
                    SummonHelper(NPC_PLAGUED_CHAMPION, RAID_MODE(2, 4));
                    break;
                case 1:
                    SummonHelper(NPC_PLAGUED_CHAMPION, RAID_MODE(1, 2));
                    SummonHelper(NPC_PLAGUED_GUARDIAN, RAID_MODE(1, 2));
                    break;
                default:
                    SummonHelper(NPC_PLAGUED_GUARDIAN, RAID_MODE(2, 4));
                    break;
                }
                break;
            case EVENT_MOVE_TO_GROUND:
                Talk(EMOTE_TELEPORT_BACK);
                me->CastSpell(me, SPELL_TELEPORT_BACK, true);
                timesInBalcony++;
                if (timesInBalcony == 3)
                {
                    DoCastSelf(SPELL_BERSERK);
                }
                StartGroundPhase();
                break;
            }
            if (me->HasReactState(REACT_AGGRESSIVE))
                DoMeleeAttackIfReady();
        }
    };
};

void AddSC_boss_noth()
{
    new boss_noth();
}
