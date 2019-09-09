///savePersonal()
/// Saves account info on disk

var account = json_encode(object_game.player);
saveCrypt(account, object_disk.accountFilePath, object_disk.accountKeyPath);
loadPersonal();
