sCarandomize();

nodes     = global.nodes.fluxo1;
liberados = global.liberados.fluxo1;

#region Shader Rainbow

_uniUV         = shader_get_uniform(sh_rainbow, "u_uv");
_uniTime       = shader_get_uniform(sh_rainbow, "u_time");
_uniSpeed      = shader_get_uniform(sh_rainbow, "u_speed");
_uniSection    = shader_get_uniform(sh_rainbow, "u_section");
_uniSaturation = shader_get_uniform(sh_rainbow, "u_saturation"); 
_uniBrightness = shader_get_uniform(sh_rainbow, "u_brightness");
_uniMix        = shader_get_uniform(sh_rainbow, "u_mix");
_uniMultiColor = shader_get_uniform(sh_rainbow, "u_multicolor");
_uniAlpha      = shader_get_uniform(sh_rainbow, "u_alpha");

_speed = 1.0;
_section = 0.5;
_saturation = 0.7;
_brightness = 0.8;
_mix = 0.5;

#endregion

info_spr = spr_caixa;

escala = 1;

shake = [0, 0];

upd_mousex = function() {return mouse_x / escala};
upd_mousey = function() {return mouse_y / escala};

selec = {
    spr : spr_selec,
    alp : [0, 0],
    x   : 0,
    y   : 1,
    xs  : 1,
    ys  : 1,
}

at     = noone;
lastat = noone;

lmx  = upd_mousex();
lmy  = upd_mousey();
hspd = 0;
vspd = 0;
sm   = false;

hold = false;

addx = [0, 0];
addy = [0, 0];

if (!array_contains(liberados, nodes[0])) array_push(liberados, nodes[0]);


nodes[0].alp = 1;
nodes[0].can = true;
nodes[0].apear = true; //Faz parte da animacao

#region Funcoes

puxa_mouse = function()
{
    var _multi = 1.5;
    
    var _kr = keyboard_check(ord("D"));
    var _kl = keyboard_check(ord("A"));
    var _ku = keyboard_check(ord("W"));
    var _kd = keyboard_check(ord("S"));
    
    var _wu = mouse_wheel_up();
    var _wd = mouse_wheel_down();
    
    var _spd = -3;
    
    if ((mouse_check_button(mb_left) and at == noone) or ((_kr xor _kl) or (_kd xor _ku))){
        if (!(_kr xor _kl) and !(_kd xor _ku)){
            hspd = (lmx-upd_mousex())*-.45;
            vspd = (lmy-upd_mousey())*-.45;
            
            sm = true;
            
            //show_message("a");
        }else{
            var _dir = point_direction(0, 0, _kr-_kl, _kd-_ku);
            
            hspd = lengthdir_x(_spd, _dir);
            vspd = lengthdir_y(_spd, _dir);
            
            //show_message("b");
        }
    }else{
        sm = false;
        
        hspd = 0;
        vspd = 0;
    }
    
    lmx = upd_mousex();
    lmy = upd_mousey();
    
    addx[1] += hspd*_multi;
    addy[1] += vspd*_multi;
    
    addx[0] = lerp(addx[0], addx[1], .25);
    addy[0] = lerp(addy[0], addy[1], .25);
    
    if (_wd xor _wu){
        var _add = _wu-_wd;
        
        var _antes_mx = upd_mousex()-addx[0];
        var _antes_my = upd_mousey()-addy[0]; 
        
        escala += _add*.1;
        escala = clamp(escala, 1, 2);
        
        var _depois_mx = upd_mousex()-addx[0];
        var _depois_my = upd_mousey()-addy[0]; 
        
        addx[1] += _depois_mx-_antes_mx;
        addy[1] += _depois_my-_antes_my;
        
        addx[0] = addx[1];
        addy[0] = addy[1];
    }
}

acha_ind = function(_qual)
{
    for (var i = 0; i < array_length(nodes); i++) {
    	if (_qual == nodes[i].id) return i;
    }
    
    return -1;
}

draw_lines = function(_i)
{
    var _n = nodes;
    
    var _n1 = _n[_i];
    var _n2 = _n[_i].conects;
        
    var _nleng = array_length(_n2);
    
    for (var i = 0; i < _nleng; i++) {
        var _ind = acha_ind(_n2[i]);
        
        var _acha = array_contains(liberados, _n[_ind]);
        
        if (_n1.final) continue;
        
        if (_n1.can){
            _n1.linha[i].x = lerp(_n1.linha[i].x, _n[_ind].x, .15);
            _n1.linha[i].y = lerp(_n1.linha[i].y, _n[_ind].y+_n[_ind].offy.r, .15);
            
            if (point_distance(_n1.linha[i].x, _n1.linha[i].y, _n[_ind].x, _n[_ind].y+_n[_ind].offy.r) <= 5){
                if (!_n[_ind].apear){
                    _n[_ind].ang = choose(-30, 30);
                
                    _n[_ind].alp_b = 1.5;
                    
                    _n[_ind].info.xs -= 1;
                    _n[_ind].info.ys -= .6;
                    
                    _n[_ind].info.addy = 10;
                    
                    screen_shake(2);
                }
                
                //show_debug_message("Apareceu: " + _n[_ind].id);
                _n[_ind].apear = true;
                
                if (_acha){
                    if (!_n[_ind].can){
                        _n[_ind].ang = choose(-30, 30);
                
                        _n[_ind].alp_b = 2;
                        
                        _n[_ind].info.xs -= 1;
                        _n[_ind].info.ys -= .6;
                        
                        _n[_ind].info.addy = 10;
                        
                        screen_shake(2);
                    }
                    
                    if (_n[_ind].final and !_n[_ind].can){
                        _n[_ind].info.balp[0] = 1.5 ;
                    }
                    
                    _n[_ind].can = true;
                    _n[_ind].info.nivel = 1;
                }
            }
        }
        

            
        var _cor = make_colour_rgb(_n1.linha[i].cores_corda[0], _n1.linha[i].cores_corda[1], _n1.linha[i].cores_corda[2]);
        
        var _offy = (_n[_ind].final) ? 0 : _n[_ind].offy.r
        
        draw_set_colour(c_black);
    	draw_line_width(_n1.x+addx[0], _n1.y+_n1.offy.r+2+addy[0], _n1.linha[i].x+addx[0], _n1.linha[i].y+_offy+2+addy[0], 3);
        draw_set_colour(c_white);
        draw_line_width(_n1.x+addx[0], _n1.y+_n1.offy.r+addy[0], _n1.linha[i].x+addx[0], _n1.linha[i].y+_offy+addy[0], 3);
        if (nodes[_ind].info.nivel > 0) _n1.linha[i].alp_rainbow = lerp(_n1.linha[i].alp_rainbow, 1, .05);
        draw_set_colour(_cor)
        draw_set_alpha(_n1.linha[i].alp_rainbow);    
    	draw_line_width(_n1.x+addx[0], _n1.y+_n1.offy.r+addy[0], _n1.linha[i].x+addx[0], _n1.linha[i].y+_offy+addy[0], 3);
        draw_set_alpha(1);    
        draw_set_colour(c_white);
        
        _n1.linha[i].cores_corda[0] = 167 + 88 * sin(current_time / _n1.linha[i].inicores_corda[0]);
        _n1.linha[i].cores_corda[1] = 167 + 88 * sin(current_time / _n1.linha[i].inicores_corda[1] + 2);
        _n1.linha[i].cores_corda[2] = 167 + 88 * sin(current_time / _n1.linha[i].inicores_corda[2] + 4);
    }
}

desenha_nodes = function()
{
    for (var i = 0; i < array_length(nodes); i++) {
        draw_lines(i);        
    }
    
    for (var i = 0; i < array_length(nodes); i++) {
        var _n = nodes[i];
        
        if (_n.final){
            if (!_n.apear){
                _n.ang = choose(-30, 30);
                
                _n.alp_b = 1.5;
                
                _n.info.xs -= 1;
                _n.info.ys -= .6;
                
                _n.info.addy = 10;
            }
            
            _n.apear = true;
        }
        
        if (!_n.apear) continue;
            
        //for (var j = 0; j < array_length(liberados); j++) {
        	//show_debug_message(string("{1}", i, liberados[j].id));
        //}
        
        var _rx = _n.x+addx[0];
        var _ry = _n.y+_n.offy.r+addy[0];
        
        if (_n.can or _n.final){
            shader_set(sh_rainbow);
            var uv = sprite_get_uvs(_n.spr, 0);
            shader_set_uniform_f(_uniUV, uv[0], uv[2]);
            shader_set_uniform_f(_uniSpeed, _speed);
            shader_set_uniform_f(_uniTime, _n._time);
            shader_set_uniform_f(_uniSaturation, _saturation);
            shader_set_uniform_f(_uniBrightness, _brightness);
            shader_set_uniform_f(_uniSection, _section);
            shader_set_uniform_f(_uniMix, _mix);   
            shader_set_uniform_f(_uniAlpha, 1);   
            
            if (_n.final){
                shader_set_uniform_f(_uniMultiColor, 1);
            }else{
                shader_set_uniform_f(_uniMultiColor, 0);
            }
            
            _n._time += 1 / game_get_speed(gamespeed_fps);
        }
        
        var _cor = c_white;
        
        if (!_n.can and _n.final){
            _cor = c_black;
        }
        
        if (_n.final) draw_sprite_ext(_n.spr, 0, _rx, _ry, _n.xs+.2, _n.ys+.2, _n.ang, _cor, _n.alp);
        
        if (_n.final) shader_reset();
    	draw_sprite_ext(_n.spr, 0, _rx, _ry, _n.xs, _n.ys, _n.ang, c_white, _n.alp);
        
    	if (!_n.can) draw_sprite_ext(_n.spr, 0, _rx, _ry, _n.xs, _n.ys, _n.ang, c_black, _n.alp/2);
        
        shader_reset();
        
        shader_set(sh_multi_color);
    	draw_sprite_ext(_n.spr, 0, _rx, _ry, _n.xs, _n.ys, _n.ang, c_white, _n.alp_b);
        shader_reset();
        
        #region MouseClick
        
        if (point_in_rectangle(upd_mousex(), upd_mousey(), _rx-_n.w/2, _n.y-_n.h/2+addy[0], _rx+_n.w/2, _n.y+_n.h/2+addy[0]) and !sm){
            if (at != i){
                _n.xs  = .7;
                _n.ys  = .7;
                //_n.ang = choose(-20, 20);
                _n.offy.o = -5;
                
                _n.info.nxs = _n.info.xsmax;
                _n.info.nys = _n.info.ysmax;
                
                _n.info.alp[1] = 1;
            }
            
            if (selec.alp[1] == 0){
                selec.x = _n.x+addx[0];
                selec.y = _n.y+addy[0];
            }
            
            if (lastat != i){
                selec.xs = 1.3;
                selec.ys = .7;
            }
            
            selec.alp[1] = 1;
            
            if (mouse_check_button(mb_left)){
                _n.nxs = .9;
                _n.nys = .9;
                
                hold = true;
            }
            
            if (at == i){
                _n.info.nxs = _n.info.xsmax;
                _n.info.nys = _n.info.ysmax;
            }
            
            //if (mouse_check_button_released(mb_left) and hold and _n.info.nivel <= 0){
                ////Codigo do liberamento dos nodes
                //_n.nxs = 1;
                //_n.nys = 1;
                //_n.ang = choose(-30, 30);
                //
                //_n.alp_b = 1.5;
                //
                //_n.info.nivel++;
                //
                //_n.info.xs -= 1;
                //_n.info.ys -= .6;
                //
                //_n.info.addy = 10;
                                //
                //for (var j = 0; j < array_length(_n.conects); j++) {
                	//var _ind = acha_ind(_n.conects[j]);
                    //
                    //if (array_get_index(liberados, nodes[_ind]) == -1){
                        //array_push(liberados, nodes[_ind]);
                        //
                        //nodes[_ind].alp = 1;
                    //}
                //}
                //
                //hold = false;
            //}else if (_n.info.nivel > 0){
                //_n.nxs = 1;
                //_n.nys = 1;
            //}
            //
            at = i;
            lastat = at;
        }else{
            if (at == i){
                _n.nxs = 1;
                _n.nys = 1;
                
                _n.offy.o = 0;
                
                _n.info.alp[1] = 0;
                
                _n.info.nxs = 1.5;
                _n.info.nys = 1;
                
                hold = false;
                
                at = noone;
            }
        }
        
        #endregion
        
        _n.xs = elastic("_n.xs" + string(i), _n.xs, _n.nxs, .75, .2);
        _n.ys = elastic("_n.ys" + string(i), _n.ys, _n.nys, .75, .2);
        _n.ang = elastic("_n.ang" + string(i), _n.ang, 0, .75, .125);
        _n.offy.r = elastic("_n.offy.r" + string(i), _n.offy.r, _n.offy.o, .75, .15);
        _n.alp = lerp(_n.alp, 1, .3);
        _n.alp_b = lerp(_n.alp_b, 0, .15);
        _n.info.alp[0] = lerp(_n.info.alp[0], _n.info.alp[1], .3); 
        
        //draw_text(_rx, _ry, _n.can); 
    }
    
    var _sep  = 15;
    var _offy = 23;
    
    var _info_fh = sprite_get_height(info_spr)-_offy;
    
    for (var i = 0; i < array_length(nodes); i++) { 
        var _n = nodes[i];
        
        if (!_n.apear) continue;
        
        var _txt = (_n.can) ? _n.info.txt : "TRAVADO";
        var _img = (_n.can) ? _n.info.img : spr_nula; 
        
        var _rx = _n.x+addx[0];
        var _ry = _n.y+_n.offy.r+addy[0];
        
        draw_set_halign(1);
        draw_set_valign(1);
        draw_set_font(fnt_font);
        var _realw = sprite_get_width(spr_caixa);
        var _realh = sprite_get_height(spr_caixa);
        
        var _name_w = string_width(_n.id)+9;
        
        var _maxw = max(_name_w, 180);
        
        //Somando a margem
        var _str_w = string_width_ext(_txt, _sep, _maxw)+9;
        var _str_h = string_height_ext(_txt, _sep, _maxw);
        
        var _imgh = sprite_get_height(_img)+4;
        var _imgw = sprite_get_width(_img)+9;
        
        _n.info.xsmax = max(_str_w, _imgw, _name_w)/_realw;
        _n.info.ysmax = (_str_h+_imgh+_offy)/_realh;
        
        _n.info.xsmax = max(_n.info.xsmax, 8); 
        
        var _h = sprite_get_height(info_spr)*_n.info.ys;
        var _marg = 35;
        
        for (var j = 1; j >= 0; j--) {
            if (_n.info.alp[0] < .01) break;
            
            var _x = _rx;
            var _y = _ry-(_h/2)-_marg+_n.info.addy+sin(current_time/2000)*2;
            
           draw_sprite_ext(info_spr, 0, _x, _y+1, _n.info.xs, _n.info.ys, 0, c_black, _n.info.alp[0]);
            if (_n.final){
                shader_set(sh_rainbow);
                var uv = sprite_get_uvs(_n.spr, 0);
                shader_set_uniform_f(_uniUV, uv[0], uv[2]);
                shader_set_uniform_f(_uniSpeed, _speed);
                shader_set_uniform_f(_uniTime, _n._time);
                shader_set_uniform_f(_uniSaturation, _saturation);
                shader_set_uniform_f(_uniBrightness, _brightness);
                shader_set_uniform_f(_uniSection, _section);
                shader_set_uniform_f(_uniMix, _mix);   
                shader_set_uniform_f(_uniAlpha, .75);   
                
                shader_set_uniform_f(_uniMultiColor, 0);
            } 
            
           draw_sprite_ext(info_spr, j, _x, _y, _n.info.xs, _n.info.ys, 0, c_white, _n.info.alp[0]);
            shader_reset();
            
            draw_set_halign(1);
            draw_set_valign(1);
            draw_set_font(fnt_font);
            draw_set_alpha(_n.info.alp[0]/1.5);
            
            var _divxs, _divys;
            
            _divxs = _n.info.xs/_n.info.xsmax;
            _divys = _n.info.ys/_n.info.ysmax;
            
            //2 é a parte de baixo
            var _hpreta = _h-_offy-2;
            
                //Margem da area preta
                var _top = _y-_hpreta/2-string_height(_n.id)/4;
                
                var _yy = _top;
            
            var _w = sprite_get_width(spr_caixa)*_n.info.xs;
            
            //show_message(string("{0}   {1}   {2}",  _n.info.xs, _n.info.xsmax, _n.info.xs/_n.info.xsmax))
            
            //Escreve o titulo
            draw_text_transformed(_x, _yy, _n.id, _divxs, _divys, 0);
            
            _yy += string_height(_n.id)/4 + 8;
            
            draw_set_valign(-1);
            if (_n.can){
                draw_text_ext_transformed(_x, _yy, _txt, _sep, _maxw, _divxs, _divys, 0);
                
                //Colocando a imagem para baixo e evitando que de o bug de voar
                _yy += (_imgh/2+_str_h)*_divys;
            }else{
                var _spr_tam = 12;
                var _spr = spr_cadeado;
                
                var _scale = _spr_tam/sprite_get_width(_spr);
                
                var _spr_realh = sprite_get_height(_spr)*_scale+4;
                
                draw_sprite_ext(_spr, 0, _x, _yy+_spr_realh/2, _divxs*_scale, _divys*_scale, 0, c_white, _n.info.alp[0]/1.5);
                
                //Colocando a imagem para baixo e evitando que de o bug de voar
                _yy += (_imgh/2+_str_h)*_divys;
            }
            
            draw_sprite_ext(_img, 0, _x, _yy, _divxs, _divys, 0, c_white, _n.info.alp[0]/1.5);
            
            //Indicar o centro do baguio5
            //draw_point(_x, _y+_info_fh);
            
            //draw_text(_x, _yy, (_str_h-_offy))
            
            draw_set_alpha(1);
            draw_set_halign(-1);
            draw_set_valign(-1);
            draw_set_font(-1);
                        
            shader_set(sh_multi_color);
            draw_sprite_ext(info_spr, 2, _x, _y, _n.info.xs, _n.info.ys, 0, c_white, _n.info.balp[0]);
            shader_reset();
            
            
            _n.info.xs = elastic("_n_info.xs" + string(i), _n.info.xs, _n.info.nxs, .1, .75);
            _n.info.ys = elastic("_n_info.ys" + string(i), _n.info.ys, _n.info.nys, .1, .75);
            _n.info.addy = elastic("_n_info.addy22" + string(i), _n.info.addy, 0, .05, .5);
            _n.info.balp[0] = elastic("_n_info.balpha[0]" + string(i), _n.info.balp[0], 0, .05, .5);
        }
    }
    
    if (lastat != noone){
        var _n = nodes[lastat];
        
        draw_sprite_ext(selec.spr, 0, selec.x+addx[0], selec.y+addy[0], selec.xs, selec.ys, 0, c_white, selec.alp[0]);
        
        selec.x = lerp(selec.x, _n.x, .25);
        selec.y = lerp(selec.y, _n.y+_n.offy.r, .25);
        
        selec.xs = lerp(selec.xs, _n.xs, .15);
        selec.ys = lerp(selec.ys, _n.ys, .15);
    }
    
    selec.alp[0] = lerp(selec.alp[0], selec.alp[1], .15);
}

#endregion