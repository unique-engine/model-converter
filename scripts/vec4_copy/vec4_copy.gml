// @author		Giacomo Marton
// @version		1.0.0


/*
 * Copy the data from one vector to another
 * @param	{Array<Real>} vect		(Vec4) The vector on which to copy the components
 * @param	{Array<Real>} source	(Vec4) The source vector from which to copy the components
 */
function vec4_copy(vect, source) {
	gml_pragma("forceinline");
	
	vect[Vec4.x] = source[Vec4.x];
	vect[Vec4.y] = source[Vec4.y];
	vect[Vec4.z] = source[Vec4.z];
	vect[Vec4.w] = source[Vec4.w];

}
