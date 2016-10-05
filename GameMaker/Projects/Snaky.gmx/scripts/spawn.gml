randomize();

pos_x = random(room_width) - 64
pos_y = random(room_height) - 64

x = 32 + (pos_x - (pos_x % 32));
y = 32 + (pos_y - (pos_y % 32));

if (x <= 0) x = 32;
if (y <= 0) y = 32;

if(place_snapped(32, 32)){
    move_snap(32, 32);
}
