shader_type spatial;

uniform sampler2D gradient_bw: hint_black;
uniform sampler2D gradient_color: hint_white;

void fragment()
{
	vec3 gradient_texture = texture(gradient_color, vec2(COLOR.r, 0.0)).rgb;
	vec3 gradient_texture_rgh = texture(gradient_bw, vec2(COLOR.r, 0.0)).rgb;
	
	ROUGHNESS = gradient_texture_rgh.r;
	ALBEDO = COLOR.rgb;
	ALBEDO = gradient_texture;
}