// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the linear interpolation of two input vectors by the given amount
 * @param	{Array<Real>} vect_1		(Vec3) The first vector
 * @param	{Array<Real>} vect_2		(Vec3) The second vector
 * @param	{Real} amount				The amount to interpolate
 * @returns	{Array<Real>}				(Vec3)
 */
function vec3_lerp(vect_1, vect_2, amount) {
	gml_pragma("forceinline");
	
	return [vect_1[Vec3.x] + amount * (vect_2[Vec3.x] - vect_1[Vec3.x]),
			vect_1[Vec3.y] + amount * (vect_2[Vec3.y] - vect_1[Vec3.y]),
			vect_1[Vec3.z] + amount * (vect_2[Vec3.z] - vect_1[Vec3.z]) ];

}
