/*
 * Powered by DecrypteD of Underx.org
 */

#include "ScriptMgr.h"
#include "ScriptMgrMacros.h"

void ScriptMgr::OnMetricLogging()
{
    ExecuteScript<MetricScript>([&](MetricScript* script)
    {
        script->OnMetricLogging();
    });
}
