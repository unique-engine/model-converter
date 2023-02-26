// @author		Giacomo Marton
// @version		1.0.0


/**
 * Transforms a position vector using a matrix
 * @param	{Array<Real>} vect		(Vec3) The vector to transform
 * @param	{Array<Real>} mtx		(Mat4) The matrix
 * @returns	{Array<Real>}			(Vec3)
 */
function vec3_transform_position(vect, mtx) {
	gml_pragma("forceinline");
	
	var vec_x = vect[Vec3.x];
	var vec_y = vect[Vec3.y];
	var vec_z = vect[Vec3.z];

	var w = vec_x * mtx[Mat4.m03] +
			vec_y * mtx[Mat4.m13] +
			vec_z * mtx[Mat4.m23] +
					mtx[Mat4.m33];
					
	if (w == 0) return vec3_zero;
	
	return [(vec_x * mtx[Mat4.m00] +
			vec_y * mtx[Mat4.m10] +
			vec_z * mtx[Mat4.m20] +
					mtx[Mat4.m30]) / w,
			
			(vec_x * mtx[Mat4.m01] +
			vec_y * mtx[Mat4.m11] +
			vec_z * mtx[Mat4.m21] +
					mtx[Mat4.m31]) / w,
			
			(vec_x * mtx[Mat4.m02] +
			vec_y * mtx[Mat4.m12] +
			vec_z * mtx[Mat4.m22] +
					mtx[Mat4.m32]) / w];

}


/**
 * Transforms a direction vector using a matrix
 * @param	{Array<Real>} vect		(Vec3) The vector to transform
 * @param	{Array<Real>} mtx		(Mat4) The matrix
 * @returns	{Array<Real>}			(Vec3)
 */
function vec3_transform_direction(vect, mtx) {
	gml_pragma("forceinline");
	
	var vec_x = vect[Vec3.x];
	var vec_y = vect[Vec3.y];
	var vec_z = vect[Vec3.z];

	return [vec_x * mtx[Mat4.m00]+
		    vec_y * mtx[Mat4.m10]+
		    vec_z * mtx[Mat4.m20],
		
		    vec_x * mtx[Mat4.m01]+
		    vec_y * mtx[Mat4.m11]+
		    vec_z * mtx[Mat4.m21],
		
		    vec_x * mtx[Mat4.m02]+
		    vec_y * mtx[Mat4.m12]+
		    vec_z * mtx[Mat4.m22]];
    
}