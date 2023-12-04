//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D mask_tex;
uniform float time;
uniform float tolerance;
uniform float inverse;



void main(){
	
	float time_ext =time+time*tolerance;
	
    vec4 base_col  = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	float mask_val = abs(inverse - texture2D( mask_tex, v_vTexcoord ).r);
	mask_val = smoothstep(mask_val, mask_val+tolerance,time_ext);
	gl_FragColor = vec4(base_col.rgb, base_col.a*mask_val);
}
