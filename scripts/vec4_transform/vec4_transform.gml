// @author		Giacomo Marton
// @version		1.0.0


/**
 * Transforms a vector using the given matrix
 * @param	{Array<Real>} vect		(Vec4) The vector to transform
 * @param	{Array<Real>} mtx		(Mat4) The matrix used for transformation
 * @returns	{Array<Real>}			(Vec4)
 */
function vec4_transform(vect, mtx) {
	gml_pragma("forceinline");
	
	var vec_x = vect[Vec4.x];
	var vec_y = vect[Vec4.y];
	var vec_z = vect[Vec4.z];
	var vec_w = vect[Vec4.w];

	return [vec_x * mtx[Mat4.m00]+
		    vec_y * mtx[Mat4.m10]+
		    vec_z * mtx[Mat4.m20]+
		    vec_w * mtx[Mat4.m30],
			
		    vec_x * mtx[Mat4.m01]+
		    vec_y * mtx[Mat4.m11]+
		    vec_z * mtx[Mat4.m21]+
		    vec_w * mtx[Mat4.m31],
			
		    vec_x * mtx[Mat4.m02]+
		    vec_y * mtx[Mat4.m12]+
		    vec_z * mtx[Mat4.m22]+
		    vec_w * mtx[Mat4.m32],
			
		    vec_x * mtx[Mat4.m03]+
		    vec_y * mtx[Mat4.m13]+
		    vec_z * mtx[Mat4.m23]+
		    vec_w * mtx[Mat4.m33]];

}
