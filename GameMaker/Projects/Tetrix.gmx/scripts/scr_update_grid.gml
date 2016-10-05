if (is_array(argument0) and is_array(argument1)){
    var pos_x = argument2;
    var pos_y = argument3;
    var idx_x = 0;
    var idx_y = 0;
    
    for (xx=0; xx<array_length_2d(argument0, 0); xx+=1)
    {
        for(yy=0; yy<array_length_2d(argument0, 1); yy+=1){
            if (xx == pos_x and yy == pos_y){
                argument0[xx, yy] = argument1[idx_x, idx_y];
                
                idx_x += 1;
                pos_x += 1;
            }                  
        };
    };
}

