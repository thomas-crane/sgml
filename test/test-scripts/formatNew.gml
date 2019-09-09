///formatNew(map_new)

var new = argument0;
var text = '';
var title =  translate("NEWS", string(new[? "type"])+"."+string(new[?"variant"])+".title");
var data = json_decode(base64_decode(new[? "data"]));

switch (new[? "type"]){
    case 0:
        text = new[? "data"];
        break;
        
    case 1:
        var motto = data[? "motto"];
        if (string_length(motto) <= 0){
            motto = translate("MOTTOS", "default");
        }
    
        text = translate("NEWS", string(new[? "type"])+"."+string(new[?"variant"]));
        text = string_replace_all(text, '$COMPANY', data[? "name"]);
        text = string_replace_all(text, '$OWNER', data[? "owner"]);
        text = string_replace_all(text, '$MOTTO', motto);
        
        title = string_replace_all(title, '$COMPANY', data[? "name"]);
        
        break;
        
    case 3:
        text = translate("NEWS", string(new[? "type"])+"."+string(new[?"variant"]));
        text = string_replace_all(text, '$RSC', translate("RSC", data[? "rsc"]));
        text = string_replace_all(text, '$PRICE', "C "+numberFormat(round(data[? "value"]*getRessource(data[? "rsc"], "price"))));
        
        title = string_replace_all(title, '$RSC', translate("RSC", data[? "rsc"]));
        break;
        
    case 2:
        text = translate("NEWS", string(new[? "type"])+"."+string(new[?"variant"]));
        text = string_replace_all(text, '$COMPANY', data[? "name"]);
        text = string_replace_all(text, '$OWNER', data[? "owner"]);
        
        title = string_replace_all(title, '$COMPANY', data[? "name"]);
        break;
        
    case 4:
        var former = data[? "former"];
        var leader = data[? "leader"];
        
        text = translate("NEWS", string(new[? "type"])+"."+string(new[?"variant"]));
        text = string_replace_all(text, '$FORMER_COMPANY', former[? "name"]);
        text = string_replace_all(text, '$FORMER_OWNER', former[? "owner"]);
        text = string_replace_all(text, '$LEADER_COMPANY', leader[? "name"]);
        text = string_replace_all(text, '$LEADER_OWNER', leader[? "owner"]);
        
        title = string_replace_all(title, '$LEADER_COMPANY', leader[? "name"]);
        break;
}

ds_map_logdestroy(data);
text =  date_date_string(date_timestamp(new[? "time"]))+" - "+text;
return (array(title, text));
