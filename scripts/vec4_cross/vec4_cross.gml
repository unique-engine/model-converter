// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the cross product of <vect_1> and <vect_2>.
 * @param	{Array<Real>} vect_1		(Vec4) The first vector
 * @param	{Array<Real>} vect_2		(Vec4) The second vector
 * @returns	{Array<Real>}				(Vec4)
 */
function vec4_cross(vect_1, vect_2) {
	gml_pragma("forceinline");
	
	return [vect_1[Vec4.y] * vect_2[Vec4.z] - vect_1[Vec4.z] * vect_2[Vec4.y],
			vect_1[Vec4.z] * vect_2[Vec4.x] - vect_1[Vec4.x] * vect_2[Vec4.z],
			vect_1[Vec4.x] * vect_2[Vec4.y] - vect_1[Vec4.y] * vect_2[Vec4.x],
			0.0];

}
