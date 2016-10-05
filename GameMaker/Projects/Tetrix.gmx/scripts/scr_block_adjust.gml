if (is_array(argument0)){
    for (i=1; i<array_length_1d(argument0); i+=1)
    {
        argument0[i].x = argument0[0].x;
        argument0[i].y = argument0[0].y;
    }
    
    switch (argument1)
    {
        case Blocks.T:
            switch(argument2){ 
                case 0:
                    argument0[1].x += 32;
                    argument0[2].x -= 32;
                    argument0[3].y -= 32;
                break;
                
                case 1:
                    argument0[1].y -= 32;
                    argument0[2].x += 32;
                    argument0[3].y += 32;
                break;
                
                case 2:
                    argument0[1].x -= 32;
                    argument0[2].x += 32;
                    argument0[3].y += 32;
                break;
                
                case 3:
                    argument0[1].y -= 32;
                    argument0[2].x -= 32;
                    argument0[3].y += 32;
                break;
            }
        break;
        
        case Blocks.L:
            switch(argument2){ 
                case 0:
                    argument0[1].y += 32;
                    argument0[2].x += 32;
                    argument0[3].x += 64;
                break;
                
                case 1:
                    argument0[1].x -= 32;
                    argument0[2].y += 32;
                    argument0[3].y += 64;
                break;
                
                case 2:
                    argument0[1].x -= 32;
                    argument0[2].x -= 64;
                    argument0[3].y -= 32;
                break;
                
                case 3:
                    argument0[1].x += 32;
                    argument0[2].y -= 32;
                    argument0[3].y -= 64;
                break;
            }
        break;
        
        default: return noone;
    }
}
