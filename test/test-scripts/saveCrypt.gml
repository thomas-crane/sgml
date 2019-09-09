///saveCrypt(str, str_filename, str_keypath, *loops = 2)

var data = base64_encode(argument[0]);
var loops = 2;
if (argument_count > 3){
    loops = argument[3];
}
var msgBuffer = buffer_create(string_byte_length(data)+1, buffer_fixed, 1);

buffer_seek(msgBuffer, buffer_seek_start, 0);
buffer_write(msgBuffer, buffer_string, data);

//////////////////////////////////////////////
///                                        ///
///              KEY GENERATION            ///

var keyBuffer = buffer_create(48, buffer_fixed, 1);
var offset;
if (file_exists(argument[2])){
    keyBuffer = buffer_load(argument[2]);
    offset = buffer_peek(keyBuffer, 0, buffer_u8);
}
else{
    var shash = buffer_sha1(msgBuffer, 0, buffer_get_size(msgBuffer));
    offset = floor(random(16));
    
    buffer_seek(keyBuffer, buffer_seek_start, 1);
    
    for (var i = 0; i < buffer_get_size(keyBuffer); i++){
        buffer_write(keyBuffer, buffer_u8, hexdec(string_char_at(shash, i%string_length(shash)))%8);
    }
    buffer_poke(keyBuffer, 0, buffer_u8, offset);
}

///                 END OF                 ///
///                                        ///
//////////////////////////////////////////////



var finalBuffer = buffer_create(buffer_get_size(msgBuffer), buffer_fixed, 1);

for (startOrd = 0; startOrd < loops; startOrd ++){
    var lastOrd = startOrd;
    for (var i = -0; i < buffer_get_size(msgBuffer); i++){
        var pos = (i) mod (buffer_get_size(msgBuffer));
        if (pos < 0){
            pos = buffer_get_size(msgBuffer)-offset;
        }
        buffer_seek(msgBuffer, buffer_seek_start, pos);
        buffer_seek(keyBuffer, buffer_seek_start, (i+1+offset)%(buffer_get_size(keyBuffer)));
        var b1 = buffer_read(msgBuffer, buffer_string);
        var b2 = buffer_read(keyBuffer, buffer_u8);
        
        var b3 = ord(b1);
        if (lastOrd > 0){
            var b3 = ord((b1)) - b2;
            if (b3 < 0){
                //b3 = 256+b3;
                b3 = 0;
            }
            lastOrd = 0;
        }
        else{
            lastOrd = ord(b1);
        }
        buffer_poke(finalBuffer, i, buffer_string, ansi_char(b3));
    }
    buffer_copy(finalBuffer, 0, buffer_get_size(finalBuffer), msgBuffer, 0);
}
buffer_save(keyBuffer, argument[2]);
buffer_save(finalBuffer, argument[1]);

buffer_delete(keyBuffer);
buffer_delete(finalBuffer);
buffer_delete(msgBuffer);
