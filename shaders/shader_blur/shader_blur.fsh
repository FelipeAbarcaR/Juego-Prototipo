varying vec2 v_uv0;
varying vec2 v_uv0Ratio;

uniform float u_threshold;

void main()
{
    float pi = 3.14159265359;
    float circle = 2.0 * pi;
    
    vec4 blur = vec4(0.0,0.0,0.0,0.0);
    
    int SAMPLES = 8;

    for (int i = 0; i < SAMPLES; i++)
    {
        highp float angle = (circle / float(SAMPLES)) * float(i);
        
        highp float shift_x = cos(angle) * u_threshold;
        highp float shift_y = sin(angle) * u_threshold;
        highp vec2 shiftUV =  v_uv0 + vec2(shift_x, shift_y);
        
        blur += texture2D(gm_BaseTexture, shiftUV) / float(SAMPLES);
    }
    
    vec4 Complete = blur;
    
    gl_FragColor = Complete;
}

