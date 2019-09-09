///regularizeCrew(downloadedCrew)
var crew = argument0;

for (var i = 0; i < ds_list_size(crew); i++){
    var onlineMember = crew[|i];
    var newMember = genEmmet(false, onlineMember);
    ds_map_logdestroy(onlineMember);
    crew[|i] = newMember;
    ds_list_mark_as_map(crew, i);
}
