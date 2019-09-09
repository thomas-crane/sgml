///warnTip(str, *duration)
var duration = 5;
if (argument_count > 1){
    duration = argument[1];
}
var str = argument[0];

object_tipsman.warnText = "/!\ "+translate("GENERAL_UI", "warning")+" /!\ #"+str;
object_tipsman.warnTime = duration;
playSfx(sound_sfx_warning);
