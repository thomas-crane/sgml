///createMenu(array MENU_ ...)
var m = instance_create(0,0,object_main_menu);
m.buttons = argument0;
m.blockHeight = m.buttonHeight*array_length_1d(argument0) 
                + m.buttonHSpacing*(array_length_1d(argument0)-1)
                + m.blockPadding*2;

m.blockPosition = array(
                    SCREEN_WIDTH/2-m.blockWidth/2,   
                    SCREEN_HEIGHT/2-m.blockHeight/2,
                    SCREEN_WIDTH/2+m.blockWidth/2,  
                    SCREEN_HEIGHT/2+m.blockHeight/2       
);
                       
return m;
