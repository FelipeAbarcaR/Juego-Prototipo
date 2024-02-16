//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 texture_Pixel;

void main()
{
	
	// change here thickness of outline 1.0, 2.0 etc.
	vec2 thickness = texture_Pixel * 1.0;
	
	vec4 end_pixel =  v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if ( texture2D( gm_BaseTexture, v_vTexcoord ).a > 0.0) { 
		 
		end_pixel = vec4(0.299, 0.387, 0.114,1); 
		}
	
	
    gl_FragColor = end_pixel;
}
