#version 130

uniform vec4 ambient;

uniform vec3 lightcolor1;
uniform vec3 lightdir1;
uniform vec3 halfvec1;

uniform vec3 lightcolor2;
uniform vec3 lightdir2;
uniform vec3 halfvec2;

in vec4 pass_color;
in vec3 norm;

out vec4 out_color;

void main(){
  vec3 amb = vec3(ambient);


  float diffuse1 = max(0.0, dot(norm, normalize(lightdir1)));
  float specular1 = max(0.0, dot(norm, normalize(halfvec1)));
  float diffuse2 = max(0.0, dot(norm, normalize(lightdir2)));
  float specular2 = max(0.0, dot(norm, normalize(halfvec2)));

  if (diffuse1 == 0.0)
      specular1 = 0.0;
  else
      specular1 = pow(specular1, 7);
  if (diffuse2 == 0.0)
      specular2 = 0.0;
  else specular2 = pow(specular2, 5);

  vec3 sLight = ambient.rgb + lightcolor1 * diffuse1 + lightcolor2 *diffuse2;
  vec3 rLight = lightcolor1 * specular1 * 15;
  vec3 rLight2 = lightcolor2 * specular2 * 20;

  vec3 rgb = min((pass_color.rgb * amb) * sLight + rLight + rLight2, vec3(1.0));

  out_color=vec4(rgb, pass_color.a);
}
