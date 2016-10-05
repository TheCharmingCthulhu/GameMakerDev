#define ListUtilities

#define ds_list_solid_objects
if (instance_count > 0)
{       
    for (i=0; i<instance_count; i+=1)
        if (instance_id[i].solid)
            arr[0] = instance_id[i];
    
    return arr;
} else return noone;
