shader_type spatial;
render_mode unshaded;

uniform sampler2D gradient : black_hint;

void fragment()
{
	vec3 color = texture(gradient, UV).rgb;
//	EMISSION = color * 2.0;
	ALBEDO = color;
}