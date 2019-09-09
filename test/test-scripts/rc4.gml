/// rc4(str,key,decrypt)

var str = argument0;
var key = argument1;
var lx;

var s = array(noone);
for (var i = 0; i < 256; i++){
    s[i] = i;
}

var j = 0;
for (var i = 0; i < 256; i++){
    j = (
            j + s[i] + ord(
                string_char_at(
                    key, i%string_length(
                        key
                    )
                    +1
                )
            )
        )%256;
    lx = s[i];
    s[i] = s[j];
    s[j] = lx;
}

var i = 0;
j = 0;
var res = '';

for (var ly = 0; ly < string_length(str); ly++){
    i = (i+1) % 256;
    j = (j + s[i]) % 256;
    lx = s[i];
    s[i] = s[j];
    s[j] = lx;
    
    
    var xored = (string_char_at(str, ly+1) ^ chr(s[(s[i] + s[j]) % 256]));
    var xoredChunk = "x"+string(real(xored));
    res += xoredChunk;
}

return res;
