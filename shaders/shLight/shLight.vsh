attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;                    // (x,y,z)
attribute vec2 in_TextureCoord;              // (u,v)
attribute vec4 in_Colour;                    // (r,g,b,a)

varying vec3 v_Normal;
varying vec3 v_Position;
varying vec2 v_Texcoord;
varying vec4 v_Colour;

void main() {
	vec4 object_space_pos = vec4(in_Position, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;

    v_Position = vec3(gm_Matrices[MATRIX_WORLD] * object_space_pos);
	v_Normal = mat3(gm_Matrices[MATRIX_WORLD]) * in_Normal;    
    v_Texcoord = in_TextureCoord;
    v_Colour = in_Colour;
}
