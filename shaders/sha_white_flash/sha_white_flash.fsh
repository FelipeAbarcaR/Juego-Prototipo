//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float flash;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = vec4(
	//el r,g y b son red, green, blue que entre mas grandes sea el numero (max255) mas blanco va hacer
	gl_FragColor.r + flash,
	gl_FragColor.g + flash,
	gl_FragColor.b + flash,
	gl_FragColor.a);
	
	
}