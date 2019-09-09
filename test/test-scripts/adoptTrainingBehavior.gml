///adoptTrainingBehavior(id)
var emmet = argument0;
for (var i = 0; i < ds_list_size(emmet.trainings); i++){
    var training = emmet.trainings[|i];
    switch (training){
        case TRAINING_GEOLOG:
            emmet.geoTimer += 1/room_speed;
            if (emmet.geoTimer > emmet.geoEvery){
                emmet.geoTimer = 0;
                var pulsar = instance_create(emmet.x, emmet.y, object_geopulse);
                if (crewMembersRemaining() > 0){
                    pulsar.color = getEmmetColor(getDeployedCrewMember(emmet.eid));
                }
                else{
                    pulsar.color = c_lime;
                }
                pulsar.lootDetector = true;
            }
            break;
    }
}
