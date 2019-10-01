shader_type spatial;
render_mode unshaded, cull_disabled;

uniform sampler2D gradient: hint_black;
uniform sampler2D noise_texture: hint_white;

varying float height;

void vertex()
{
float test = texture(noise_texture, UV).r;

//VERTEX.y += cos(VERTEX.x*4.0*sin(TIME*0.01)) * sin(VERTEX.z*6.0*sin(TIME*0.02));
//VERTEX.y += (cos(VERTEX.x * test) * sin(VERTEX.z * test)* (sin(TIME)+1.0))*0.3;
height= sin(VERTEX.x*3.0+TIME)+sin(VERTEX.x*7.0+TIME);
height += sin(VERTEX.z*1.10+TIME)*0.4+sin(VERTEX.z*0.20+TIME)*0.7;

VERTEX.y += height;
}



void fragment()
{
vec4 gradient_texture = texture(gradient, UV);

ALBEDO = gradient_texture.rgb+vec3(max(0,((height+3.1)/6.2-0.55)));
ROUGHNESS = 0.4;
}
