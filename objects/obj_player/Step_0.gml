if (instance_exists(obj_dialog))
{
    switch (sprite_index) {
        case spr_player_walk_down:
            sprite_index = spr_player_idle_down; 
        break;
        case spr_player_walk_up:
            sprite_index = spr_player_idle_up;
        break;
        case spr_player_walk_right: 
            sprite_index = spr_player_idle_right; 
        break;
        case spr_player_walk_left: 
            sprite_index = spr_player_idle_left; 
        break;
    }
    exit;
}

var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

move_and_collide(_hor * move_speed, _ver * move_speed, tilemap, undefined, undefined, undefined, move_speed, move_speed);

if (_hor != 0 or _ver != 0)
{
    if (_ver > 0) 
        sprite_index = spr_player_walk_down;
    else if (_ver < 0)
        sprite_index = spr_player_walk_up;
    else if (_hor > 0)
        sprite_index = spr_player_walk_right;
    else if (_hor < 0)
        sprite_index = spr_player_walk_left;
}
else 
{
    switch (sprite_index) {
        case spr_player_walk_down:
            sprite_index = spr_player_idle_down;
            break;
        case spr_player_walk_up:
            sprite_index = spr_player_idle_up;
            break;
        case spr_player_walk_right:
            sprite_index = spr_player_idle_right;
            break;
        case spr_player_walk_left:
            sprite_index = spr_player_idle_left;
            break;
    }
}

if (hp <= 0)
{
    game_restart();
}