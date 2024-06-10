//
// Simple through fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float part_degrees; 

uniform vec2 uv_center;

void main()
{
    float angle = radians(part_degrees);
    float num_pie = radians(180.0);

    float pixelAngle = atan(abs(v_vTexcoord.x-uv_center[0]),abs(v_vTexcoord.y-uv_center[1]));
	
	vec2 myTexcoord = v_vTexcoord;
   
	if(myTexcoord.x > uv_center[0] && v_vTexcoord.y<=uv_center[1])
	{
	    if (pixelAngle < angle)
		{
			gl_FragColor = vec4(0.0);
		}
		else
		{
		    gl_FragColor = texture2D( gm_BaseTexture, myTexcoord );
		}
	}
	
	if(v_vTexcoord.x>=uv_center[0] && v_vTexcoord.y>uv_center[1])
	{
		if (num_pie-pixelAngle < angle)
		{
			gl_FragColor = vec4(0.0, 0.0, 0.0, 0.0);
		}
		else
		{
			gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord);
		}
	}
	
	if(v_vTexcoord.x<uv_center[0] && v_vTexcoord.y>uv_center[1])
	{
		if (num_pie+pixelAngle < angle)
		{
			gl_FragColor = vec4(0.0, 0.0, 0.0, 0.0);
		}
		else
		{
			gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord);
		}
	}
	
	if(v_vTexcoord.x<uv_center[0] && v_vTexcoord.y<=uv_center[1])
	{
		if (2.0*num_pie-pixelAngle < angle)
		{
			gl_FragColor = vec4(0.0, 0.0, 0.0, 0.0);
		}
		else
		{
			gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord);
		}
	}
}
