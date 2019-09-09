///destroySavegame()

if (directory_exists(object_disk.securityPath)){
    log("Destroying security folder", "DSTRSUMS");
    directory_destroy(object_disk.securityPath);
    directory_destroy(object_disk.crewPath);
    directory_destroy(object_disk.companyPath);
    directory_destroy(object_disk.miscPath);
    directory_destroy(object_disk.stocksPath);
}
loadSums();
