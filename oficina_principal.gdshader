shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_linear_mipmap;
uniform float distortion_strength : hint_range(0.0, 1.0) = 1;
uniform float distortion_radius_x : hint_range(0.0, 2.0) = 1; // Radio independiente para X
uniform vec2 center = vec2(0.5, 0.5);

void fragment() {
    vec2 uv = SCREEN_UV;
    vec2 centered_uv = uv - center;

    float r = length(vec2(centered_uv.x / distortion_radius_x, 0));

    float distortion = 1.0 - distortion_strength * pow(r, 2.0);

    vec2 distorted_uv = centered_uv * distortion + center;
    COLOR = texture(SCREEN_TEXTURE, distorted_uv);
}