#define DataStructureUtilities


#define ds_list_solid_objects
/// "Syntax: ds_list_solid_objects();"
/// Returns a list of all solid objects in the current room.
if (instance_count > 0)
{       
    lst = ds_list_create();
    
    for (i=0; i<instance_count; i+=1)
        if (instance_id[i].solid)
            if (ds_list_find_index(lst, instance_id[i].object_index) == -1)
                ds_list_add(lst, instance_id[i].object_index);
    
    return lst;
} else return noone;

#define ds_grid_next_add
/// Syntax: "ds_grid_next_add(#grid, #value);"
/// Adds a providen value to a free cell in grid, otherwise returns false.
if (ds_exists(argument0, ds_type_grid)){
    
    for (gx=0; gx<ds_grid_width(argument0); gx+=1)
    {
        for (gy=0; gy<ds_grid_height(argument0); gy+=1)
        {
            show_debug_message(argument0[# gx, gy]);
        
            if (argument0[# gx, gy] == 0){
                argument0[# gx, gy] = argument1;    
            
                return true;
            } 
        };
    };
    
    return false;
}


#define ds_grid_contains
/// Syntax: "ds_grid_contains(#object_index);"

if (ds_exists(argument0, ds_type_grid)){
    for (gx=0; gx<ds_grid_width(argument0); gx+=1)
    {
        for (gy=0; gy<ds_grid_height(argument0); gy+=1)
        {
            if (argument0[# gx, gy] != 0)
                if (argument0[# gx, gy].object_index == argument1)
                    return true;
        };
    };
    
    return false;
}