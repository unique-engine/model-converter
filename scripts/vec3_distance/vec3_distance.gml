// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the distance between the given vectors
 * @param	{Array<Real>} vect_1		(Vec3) The first vector
 * @param	{Array<Real>} vect_2		(Vec3) The second vector
 * @returns	{Real}
 */
function vec3_distance(vect_1, vect_2) {
	gml_pragma("forceinline");
	
	var vec0 = vect_1[Vec3.x] - vect_2[Vec3.x];
	var vec1 = vect_1[Vec3.y] - vect_2[Vec3.y];
	var vec2 = vect_1[Vec3.z] - vect_2[Vec3.z];

	return sqrt(vec0 * vec0 +
	            vec1 * vec1 +
	            vec2 * vec2 );

}
