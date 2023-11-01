// Fragment shader
varying vec2 v_vTexcoord;
void main()
{
    vec4 color = texture2D( gm_BaseTexture, v_vTexcoord );

    if (v_vTexcoord.y < 0.5) {
        // Top half, set to red
        gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
    } else {
        // Bottom half, set to yellow
        gl_FragColor = vec4(1.0, 1.0, 0.0, 1.0);
    }
}