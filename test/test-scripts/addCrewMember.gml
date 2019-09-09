///addCrewMember(crewMember)
argument0[? "creationTime"] = date_current_datetime();
ds_list_add(object_station.crew, argument0);
maxStat('maxCrew', ds_list_size(object_station.crew));
