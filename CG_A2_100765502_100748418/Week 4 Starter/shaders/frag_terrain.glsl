#version 410
in vec3 color;
in vec2 texUV;

out vec4 frag_color;

uniform sampler2D myTextureSampler;
uniform sampler2D sandTexture;
uniform sampler2D grassTexture;
uniform sampler2D stoneTexture;
uniform sampler2D snowTexture;

vec3 sandCol = texture(sandTexture, texUV).rgb;
vec3 grassCol = texture(grassTexture, texUV).rgb;
vec3 stoneCol = texture(stoneTexture, texUV).rgb;
vec3 snowCol = texture(snowTexture, texUV).rgb;



void main() {
  
    vec3 finalCol = mix(sandCol, grassCol, smoothstep(0.1, 0.3, texture(myTextureSampler, texUV).r));
	finalCol = mix(finalCol, stoneCol, smoothstep(0.35, 0.5, texture(myTextureSampler, texUV).r));
	finalCol = mix(finalCol, snowCol, smoothstep(0.7, 0.8, texture(myTextureSampler, texUV).r));
	
	
	frag_color = vec4(finalCol, 1.0); //texture(sandTexture, texUV);//* vec4(color, 1.0);

}