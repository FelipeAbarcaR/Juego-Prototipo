varying vec2 v_uv0;
varying vec2 v_uv0Ratio;

uniform vec3 u_colorA;
uniform vec3 u_colorB;

void main()
{
    vec4 DF = texture2D( gm_BaseTexture, v_uv0 );
    vec3 weights = vec3( 0.3, 0.59, 0.11);
    float lum = dot(DF.rgb, weights);
    
    vec4 Complete = vec4(1.0,1.0,1.0,1.0);
    Complete.rgb = mix(u_colorA, u_colorB, lum);
    
    gl_FragColor = Complete;
}

