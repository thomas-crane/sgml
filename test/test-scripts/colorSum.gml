///colorSum(str)

var name = argument[0];

var sum = xUtf(string(name));
var r_sum = (sum+200)%201+55;
var b_sum = (sum/4+200)%201+55;
var g_sum = (sum*4+200)%201+55;
return make_color_rgb(r_sum, b_sum, g_sum);
