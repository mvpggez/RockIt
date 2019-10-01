shader_type spatial;
//render_mode unshaded;

uniform sampler2D gradient_bw: hint_black;
uniform sampler2D gradient_color: hint_white;

void fragment()
{
	vec3 gradient_texture = texture(gradient_color, vec2(COLOR.r, 0.0)).rgb;
	
	
	EMISSION = gradient_texture*1.5;
	ALBEDO = COLOR.rgb;
	ALBEDO = gradient_texture;
}