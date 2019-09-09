///demoReset()

if (!notAGameRoom(room)){
    gameOver();
}

audio_stop_all();
destroySavegame();

var demo = file_text_open_write("DEMO");
file_text_write_string(demo, 'DEMO');
file_text_close(demo);

reset();
