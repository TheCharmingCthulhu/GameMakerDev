/// Syntax: "scr_trigger_open_door(#trigger, #player);"

if (argument0.object_index == obj_trigger){
    with (argument0){
        if (target != noone){
            with(target)
                instance_destroy();
        }
    }
}
