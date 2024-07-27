/*
 * Modified by DecrypteD
 */

#include "Banner.h"
#include "GitRevision.h"
#include "StringFormat.h"

void Acore::Banner::Show(std::string_view applicationName, void(*log)(std::string_view text), void(*logExtraInfo)())
{
    log(Acore::StringFormatFmt("{} ({})", GitRevision::GetFullVersion(), applicationName));
    log("<Ctrl-C> to stop.\n");
    log(" ███████╗ ██████╗ ██╗      ██████╗  ██████╗ ██████╗ ██████╗ ███████╗");
    log(" ██╔════╝██╔═══██╗██║     ██╔═══██╗██╔════╝██╔═══██╗██╔══██╗██╔════╝");
    log(" ███████╗██║   ██║██║     ██║   ██║██║     ██║   ██║██████╔╝█████╗");
    log(" ╚════██║██║   ██║██║     ██║   ██║██║     ██║   ██║██╔══██╗██╔══╝");  
    log(" ███████║╚██████╔╝███████╗╚██████╔╝╚██████╗╚██████╔╝██║  ██║███████╗");
    log(" ╚══════╝ ╚═════╝ ╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝");
    log("     SOLOCore 3.3.5a  -  www.sololeveling.wtf\n");

    if (logExtraInfo)
    {
        logExtraInfo();
    }

    log(" ");
}
