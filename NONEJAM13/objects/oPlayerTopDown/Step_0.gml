if(global.pause == true)exit;
var _left, _right, _up, _down;

_left   = keyboard_check(ord("A"));
_right  = keyboard_check(ord("D"));
_up     = keyboard_check(ord("W"));
_down   = keyboard_check(ord("S"));

if(_left)           face = 0;
if(_up)             face = 2;
if(_right)          face = 4;
if(_down)           face = 6;
    
if(_left && _up)    face = 1;
if(_up && _right)   face = 3;
if(_right && _down) face = 5;
if(_down && _left)  face = 7;
velh = (_right - _left) * velmax
velv = (_down - _up)    * velmax 

move_and_collide(velh, 0, oCollision, 4)
move_and_collide(0, velv, oCollision, 4)

switch(estado){
    case "parado":
        index = 0
        velh = 0 
        velv = 0
        if(_left || _right || _up || _down){
            estado = "movimentando";
        }
    break;
    
    case "movimentando":
        index = 1
        if(velh == 0 && velv == 0){
            estado = "parado";
        }
    break;
    case "dialogo":
        velh = 0; 
        velv = 0;
        if(!instance_exists(oDialogo)){
            estado = "parado";
        }
    break;
}
if(instance_exists(oDialogo)) estado = "dialogo";