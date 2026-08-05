varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_uv;
uniform float u_speed;
uniform float u_time;
uniform float u_saturation;
uniform float u_brightness;
uniform float u_section;
uniform float u_mix;
uniform float u_alpha;

uniform float u_multicolor;

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main()
{
    float pos = ((v_vTexcoord.x - u_uv.x) + (v_vTexcoord.y - u_uv.x)) / (u_uv.y - u_uv.x);

    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);

    if (u_multicolor > 0.5){
        texColor.rgb = v_vColour.rgb;
    }

    vec3 hsv = vec3(
        u_section * ((u_time * u_speed) + pos),
        u_saturation,
        u_brightness
    );

    vec4 rainbow = vec4(hsv2rgb(hsv), texColor.a);

    gl_FragColor = mix(texColor, rainbow, u_mix);

    gl_FragColor.a *= v_vColour.a;
    
    gl_FragColor.a *= u_alpha;
}