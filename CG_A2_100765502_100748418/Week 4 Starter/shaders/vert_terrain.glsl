#version 410
layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inColor;
layout(location = 2) in vec2 inUV;

out vec3 color;
out vec2 texUV;

uniform mat4 MVP;

uniform sampler2D myTextureSampler;



//Lecture 10b
uniform float time;

void main() {
	
	color = inColor;
	texUV = inUV;

	//Lecture 10b
	vec3 vert = inPosition;
	vert.y = texture(myTextureSampler, inUV ).r;

	//vert.y = sin(vert.x * 5.0 + time* 0.1 )* 0.2;

	gl_Position = MVP * vec4(vert, 1.0);

	//gl_Position = MVP * vec4(vertex_pos, 1.0);
}
	