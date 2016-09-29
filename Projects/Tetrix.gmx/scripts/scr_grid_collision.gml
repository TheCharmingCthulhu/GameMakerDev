/// Syntax: scr_grid_validate(#grid, #block_array, #x, #y);

if (is_array(argument0) and is_array(argument1)){
    for (xx=0; xx<array_length_2d(argument1, 0); xx+=1)
        for (yy=0; yy<array_length_2d(argument1, 1); yy+=1)
            if (argument0[argument2 + xx, argument3 + yy] == 1)
                return true;
    return false;
}
