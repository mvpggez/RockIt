shader_type spatial;

uniform sampler2D gradient_bw: hint_black;
uniform sampler2D gradient_color: hint_white;

void fragment()
{
	vec3 gradient_texture = texture(gradient_color, vec2(COLOR.r, 0.0)).rgb;
	vec3 gradient_texture_metallic = texture(gradient_bw, vec2(COLOR.r, 0.0)).rgb;
	
	
	METALLIC = gradient_texture_metallic.r;
	METALLIC = 0.0;
	
	ROUGHNESS = 0.0;
	
	ALBEDO = COLOR.rgb;
	ALBEDO = gradient_texture;
//	ALBEDO = gradient_texture_metallic;
}