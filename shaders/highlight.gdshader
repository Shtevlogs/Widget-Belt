shader_type canvas_item;

uniform vec2 face_center = vec2(0.5, 0.5);
uniform float face_radius = 0.5;

void fragment() {
	vec2 uv = UV;
	float dist = distance(uv, face_center);
	float falloff = exp(-dist * dist * 6.0) - (1.0-face_radius);
	COLOR = texture(TEXTURE, UV) * vec4(1.0, 1.0, 1.0, falloff);
}
