///loadPersonal()
var accountString = (loadCrypt(object_disk.accountFilePath, object_disk.accountKeyPath));
if (accountString == false){
    return false;
}
var account = json_decode(accountString);
ds_map_logdestroy(object_game.player);
object_game.player = account;

