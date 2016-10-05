enum Blocks{
    T, L, I, O, Z
}

if (is_real(argument0) and is_real(argument1)){
    for (i=0; i<4; i+=1) 
        blocks[i] = instance_create(argument0 + (i * 32), argument1, obj_block);
    return blocks;
} 
