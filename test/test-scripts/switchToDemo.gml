///switchToDemo()
// Switches to demo mode

debugParamSet("disableCrypt", true);
offlineSwitch(true);
destroySavegame();
loadGame();

setSetting("showHumor", true);
setSetting("sfxVolume", 1);
setSetting("bgsVolume", 0.75);
setSetting("bgmVolume", 1);
setSetting("fullScreen", 1);
setSetting("cursorScale", 0.5);

debugParamSet("demoMode", true);
