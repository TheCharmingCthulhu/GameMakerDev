if (is_array(argument0)){
    var dir = argument1;

    for (i=0; i<array_length_1d(argument0); i+=1)
        switch(dir){
            case 0:
                if (place_meeting(argument0[i].x, argument0[i].y + 32, obj_wall)) return true;    
            case 1:
                if (place_meeting(argument0[i].x + 32, argument0[i].y, obj_wall)) return true;
            case 2:
                if (place_meeting(argument0[i].x - 32, argument0[i].y, obj_wall)) return true;
            case 3:
                if (place_meeting(argument0[i].x, argument0[i].y - 32, obj_wall)) return true;
        }
        
    return false;
}
