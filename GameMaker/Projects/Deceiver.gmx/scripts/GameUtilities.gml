#define GameUtilities



#define point_direction_int
/// Syntax: point_direction_int(#x1, #y1, #x2, #y2);
/// Get the direction, this instance is pointing towards the other instance.
return floor((point_direction(argument0, argument1, argument2, argument3) / 360) * 4);

#define collision_array
/// Syntax: "collision_array(#x, #y, #array_of_objects);"
/// Test collision between the providen (x, y) values and the array of objects!.
if (is_array(argument2)){
    for (i=0; i<array_length_1d(argument2); i+=1)
        if (place_meeting(argument0, argument1, argument2[i])) return true;
    return false;
}

#define collision_ds_list
/// Syntax: "collision_ds_list(#x, #y, #ds_list_of_objects)"
/// Test collision between the providen (x, y) values and the ds_list of objects!.
if (ds_exists(argument2, ds_type_list)){
    for (i=0; i<ds_list_size(argument2); i+=1)
        if (place_meeting(argument0, argument1, argument2[|i])) return true;
    return false;
}

#define collision_all
/// Syntax: "collision_all(#x, #y, #ignore_id);"
/// Test collision between (x, y) and all instances currently in the room. 
/// Requires "#ignore_id" to ignore the calling instance.
for (i=0; i<instance_count; i+=1)
    if (instance_id[i] != argument2)
        if (place_meeting(argument0, argument1, instance_id[i])) return instance_id[i];
return -1;