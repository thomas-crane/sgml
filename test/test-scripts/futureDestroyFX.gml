///futureDestroyFX(particle, system, seconds)
var destroyer = instance_create(0,0, object_fx_future_destroyer);
destroyer.pclToDestroy = argument[0];
destroyer.pssToDestroy = argument[1];
destroyer.waitingTime = argument[2];
