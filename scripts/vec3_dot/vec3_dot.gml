// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the dot product of <vect_1> and <vect_2>
 * @param	{Array<Real>} vect_1		(Vec3) The first vector
 * @param	{Array<Real>} vect_2		(Vec3) The second vector
 * @returns	{Real}
 */
function vec3_dot(vect_1, vect_2) {
	gml_pragma("forceinline");
	
	return	vect_1[Vec3.x] * vect_2[Vec3.x] +
			vect_1[Vec3.y] * vect_2[Vec3.y] +
			vect_1[Vec3.z] * vect_2[Vec3.z];

}
