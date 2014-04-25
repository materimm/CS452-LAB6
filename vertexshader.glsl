#version 130

uniform mat4 Matrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;

in vec3 in_position;

in vec4 in_color;
in vec3 in_norm;

out vec4 pass_color;
out vec3 norm;

void main(){
  gl_Position=Matrix*viewMatrix*modelMatrix*vec4(in_position,1.0); 
  norm = in_norm;
  pass_color=in_color;
}
