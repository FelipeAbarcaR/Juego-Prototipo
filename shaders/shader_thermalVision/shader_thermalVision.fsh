varying vec2 v_uv0;
varying vec2 v_uv0Ratio;

uniform sampler2D sampler0;

void main()
{    
    vec4 DF = texture2D( gm_BaseTexture, v_uv0 );
    
    vec3 weights = vec3( 0.3, 0.59, 0.11);
    float lum = dot(DF.rgb, weights);
    lum = clamp(lum, 0.0, 1.0);
    
    vec2 rUV = vec2(lum, 0.5);
    
    vec4 Complete = texture2D( sampler0, rUV );
    
    gl_FragColor = vec4(Complete.rgb, 1.0);
}

