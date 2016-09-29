/// Syntax: scr_grid_draw(g);
if (is_array(argument0)){
    for(i=0; i<instance_count; i+=1)
        if (instance_id[i] == obj_block){
            show_debug_message(string(instance_id[i]));
            
            with(instance_id[i]) 
                instance_destroy();       
        }
    
    instance_create(32 * 2, 32 * abc, obj_block);
    
    /*
    for (xx=0; xx<array_length_2d(argument0, 0); xx+=1)
        for (yy=0; yy<array_length_2d(argument0, 1); yy+=1){
            if (xx > 0 and xx < w and yy < h){
                if (argument0[xx, yy] == 1){
                    show_debug_message("X: " + string(32 * xx) + " Y:" + string(32 * yy));
                    instance_create(32 * xx, 32 * yy, obj_block);
                }
            }
        }*/
}
