#region Relacionadas Sprites


function muda_sprite(_spr = spr_fundo)
{
    if (sprite_index != _spr){
        image_index = 0;
        
        sprite_index = _spr;
    }
}

function fim_anim()
{
    var _spd = sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps);
    
    if (image_index + _spd >= image_number){
        return true;        
    }else{
        return false; 
    }
}


#endregion

#region Squash and Stratch


/// @desc Aplica um efeito de movimento elástico baseado em Lerp, mantendo uma variável interna persistente por instância. 
/// Permite que o valor acelere em direção ao alvo com o uma mola.
/// A função cria automaticamente uma variável intera única (por instância) com o nome fornecido, 
/// permitindo aplicar múltiplos efeitos elásticos no memos objeto sem conflito.
/// @param  {string} _nam Nome base da variável interna que será criada. Deve ser único para cada propriedade que usar o efeito.
/// @param  {any}    _val Valor atual que será suavizado pelo efeito.
/// @param  {any}    _tar Valor alvo que o movimento tenta alcançar.
/// @param  {real}   _for Intensidade da Força Elástica. Valores maiores aumentam o "puxão" inicial.
/// @param  {real}   _amt Suavização do movimento (0 a 1). Controla o quanto o valor interno se aproxima do objetivo a cada step.
/// @param  {real}   _ini Valor inicial da variável interna. Normalmente deixe 0.
/// @return {real}   Retorna o valor suavizado (_val + deslocamento_elástico).
function elastic (_nam, _val, _tar, _for=1, _amt=.25, _ini=0) {
    // ID do Objeto
    var _id  = id;
    // Variável Única
    var _var = "spring_" + string("{0}_{1}", _nam, _id);
    
    // Verifica se a Variável não existe
    if (!variable_instance_exists(_id, _var)) {
        // Cria a variável
        variable_instance_set(_id, _var, _ini);
    }
    
    // Pegando a variável criada e aplicando o efeito
    var _els = variable_instance_get(_id, _var);
    _els = lerp(_els, (_tar - _val) * _for, _amt);
     
    // Atualizando a variável criada
    variable_instance_set(_id, _var, _els);
     
    return _val + _els;
}

function inicia_squash()
{
    xscale  = 1;
    yscale  = 1;
    img_ang = 0;
}

function reseta_squash(_amt = .15, _elastic = false, _multi = 1)
{
    if (_elastic == false){
        xscale = lerp(xscale, 1, _amt);
        yscale = lerp(yscale, 1, _amt);
    }else{
        xscale = elastic("xscale", xscale, 1, _multi, _amt);
        yscale = elastic("yscale", yscale, 1, _multi, _amt);
    }
}

function usa_squash(_xs, _ys)
{
    xscale = _xs;
    yscale = _ys;
}

function draw_squash()
{
    draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, img_ang, image_blend, image_alpha);
}


function inicia_rainbow()
{
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
    
    _time = 0;
}

function apply_rainbow(_spr, _time, _multi = 0, _alpha = 1)
{
    shader_set(sh_rainbow);
    var uv = sprite_get_uvs(_spr, 0);
    shader_set_uniform_f(_uniUV, uv[0], uv[2]);
    shader_set_uniform_f(_uniSpeed, _speed);
    shader_set_uniform_f(_uniTime, _time);
    shader_set_uniform_f(_uniSaturation, _saturation);
    shader_set_uniform_f(_uniBrightness, _brightness);
    shader_set_uniform_f(_uniSection, _section);
    shader_set_uniform_f(_uniMix, _mix);   
    shader_set_uniform_f(_uniAlpha, _alpha);   
    
    shader_set_uniform_f(_uniMultiColor, _multi);
    
    var _tempos = _time;
    
    _tempos += 1 / game_get_speed(gamespeed_fps);
    
    return _tempos;
}

#endregion

#region Others

function resume_numeros(_quantia, _letter_add = "")
{
    var _letter = ["K", "M", "B", "T", "Q", "Qt", "Sx", "Sp", "Oc", "N", "De", "Und", "Inf"];
    var _newletter = "";
    
    var _money = 0;
    
    _money = _quantia;
    
    var _din = string(_money);
    
    var _lenght = string_length(_din);
    var _din_write = string_length(_din);
    
    var _casa = 0;
    
    var _indice = 1;
    
    for (var i = 0; i < array_length(_letter); i++) {
        _indice += 3;
        
    	if (_lenght >= _indice){
            if (_lenght > 3){
                _newletter = _letter[i];
                
                _din_write = _lenght-(_indice-1);
                
                _casa = string_copy(_din, _lenght-(_indice-2), 1)
                
                if (_letter[i] == "Inf"){
                    _din_write = 0;
                    _casa = 0;
                }
            }
        }
    }
    
    var _escrita = string_copy(_din, 0, _din_write);
    var _escrita_casa = "," + string(_casa);
    
    if (_casa == 0){
        _escrita_casa = "";
    }
    
    var _txt = string("{0}{1}{2}{3}", _letter_add, _escrita, _escrita_casa, _newletter);
    
    return _txt;
}

function screen_shake(_impact)
{
    if (instance_exists(obj_screen_shake)){
        with (obj_screen_shake) {
        	treme = _impact;
        }
    }
}

function sine_wave(time, period, amplitude, midpoint) {
    return sin(time * 2 * pi / period) * amplitude + midpoint;
}

function sine_between(time, period, minimum, maximum) {
    var midpoint = mean(minimum, maximum);
    var amplitude = maximum - midpoint;
    return sine_wave(time, period, amplitude, midpoint);
}

function array_acha(_array, _val)
{
    var _resultado = -1;
        
    var _existe = false;
    
    for (var i = 0; i < array_length(_array); i++) {
        for (var j = 0; j < array_length(_array[i]); j++) {
            if (_array[i][j] == _val){
                _existe = true;
                
                break;
            }
        }
        
        if (_existe){
            _resultado = i;
            
            break;
        }
    }
    
    return _resultado;
}

#endregion

#region Relacionado ao Som

function play_sound(_snd, _pitch_max = 0, _pitch_min = 0, _loop = false)
{
    var _pitch = random_range(_pitch_min, _pitch_max);
    
    audio_play_sound(_snd, 1, _loop, 1, , _pitch);
}


function play_music(_snd)
{
    if (!audio_is_playing(_snd)){
        var _sound = audio_play_sound(_snd, 1, true, .05);
        
        audio_sound_gain(_sound, 1, 2000);
    }
}

#endregion