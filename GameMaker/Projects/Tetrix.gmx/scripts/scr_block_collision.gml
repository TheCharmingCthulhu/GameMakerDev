if (is_array(argument0)){
    for (i=0; i<array_length_1d(argument0); i+=1){
        switch(argument1){
            case 0:
                var inst = !instance_place(argument0[i].x, argument0[i].y + 32, all);
                if (inst != noone and inst.solid) return true;
            break;
        }
    }
    
    return false;
}
