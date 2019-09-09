///loadCrypt(str_filename, str_keyname, *loops = 2)

if (!file_exists(argument[0]) || !file_exists(argument[1])){
    return false;
}

var msgBuffer = buffer_load(argument[0]);
var keyBuffer = buffer_load(argument[1]);
var startOrd = 0;
var offset = buffer_peek(keyBuffer, 0, buffer_u8);
var loops = 2;
if (argument_count > 2){
    loops = argument[2];
}
 
var finalBuffer = buffer_create(buffer_get_size(msgBuffer), buffer_fixed, 1);


for (startOrd = 0; startOrd < loops; startOrd ++){
    var lastOrd = startOrd;
    for (var i = 0; i < buffer_get_size(msgBuffer); i++){
        var pos = (i) mod (buffer_get_size(msgBuffer));
        if (pos < 0){
            pos = buffer_get_size(msgBuffer)-offset;
        }
        buffer_seek(msgBuffer, buffer_seek_start, pos);
        buffer_seek(keyBuffer, buffer_seek_start, (i+1+offset)%(buffer_get_size(keyBuffer)));
        
        var b1 = buffer_read(msgBuffer, buffer_string);
        var b2 = buffer_read(keyBuffer, buffer_u8);
        
        var b3 = ord(string(b1));
        if (lastOrd > 0){
            var b3 = ord((b1)) + b2;
            b3 = b3%256;
            lastOrd = 0;
        }
        else{
            lastOrd = b3;
        }
            buffer_poke(finalBuffer, i, buffer_string, ansi_char((b3)));
        
        
    }
    buffer_copy(finalBuffer, 0, buffer_get_size(finalBuffer), msgBuffer, 0);
}
buffer_seek(finalBuffer, buffer_seek_start, 0);

var final = base64_decode(buffer_read(finalBuffer, buffer_string));

buffer_delete(keyBuffer);
buffer_delete(finalBuffer);
buffer_delete(msgBuffer);

return final;

