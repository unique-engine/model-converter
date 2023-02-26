// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the distance between the given vectors
 * @param	{Array<Real>} vect_1		(Vec4) The first vector
 * @param	{Array<Real>} vect_2		(Vec4) The second vector
 * @returns	{Real}
 */
function vec4_distance(vect_1, vect_2) {
	gml_pragma("forceinline");
	
	var vec0 = vect_1[Vec4.x] - vect_2[Vec4.x];
	var vec1 = vect_1[Vec4.y] - vect_2[Vec4.y];
	var vec2 = vect_1[Vec4.z] - vect_2[Vec4.z];
	var vec3 = vect_1[Vec4.w] - vect_2[Vec4.w];

	return sqrt(vec0 * vec0 +
	            vec1 * vec1 +
	            vec2 * vec2 +
	            vec3 * vec3 );

}
