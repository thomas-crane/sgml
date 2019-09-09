///formatBiography(crewMember)

var biography = argument0[? "biography"];
var member = argument0;

var birthplace = biography[? "birthplace"]; if (is_undefined(birthplace)) birthplace = BIRTHPLACE_EARTH
var age = biography[? "age"]; if (is_undefined(age)) age = "???"
var trait = biography[? "trait"]; if (is_undefined(trait)) trait = TRAIT_NONE

var text = 
translate("BIOGRAPHY", "nativeTo")+" "+translate("EMMET_BIRTHPLACE", birthplace)+"
"+translate("BIOGRAPHY", "age")+": "+string(age)+"
"+translate("EMMET_TRAIT", trait);

if (ds_list_size(member[? "trainings"]) > 0){
    var trainings = (member[? "trainings"]);
    text+="##";
    for (var i = 0; i < ds_list_size(trainings); i++){
        var training = trainings[|i];
        text += translate("EMMET_TRAINING", training);
        if (i == ds_list_size(trainings)-1){
            text +=".";
        }
        else{
            text +=", ";
        }
    }
}

return text;
