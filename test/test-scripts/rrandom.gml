///rrandom(*int=1 inclusive)
//Round random INCLUSIVE
var ri = 1;
if (argument_count > 0){
    ri = random(argument[0]);
}
else{
    ri = random(ri);
}
ri = round(ri);
return ri;
