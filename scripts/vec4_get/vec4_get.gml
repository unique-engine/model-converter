// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the w component of the given vector
 * @param	{Array<Real>} vect		(Vec4) The vector from which to extrapolate the component
 * @returns	{Real}
 */
function vec4_get_x(vect) {
	gml_pragma("forceinline");
	
	return vect[Vec4.x];

}


/**
 * Returns the w component of the given vector
 * @param	{Array<Real>} vect		(Vec4) The vector from which to extrapolate the component
 * @returns	{Real}
 */
function vec4_get_y(vect) {
	gml_pragma("forceinline");
	
	return vect[Vec4.y];

}


/**
 * Returns the w component of the given vector
 * @param	{Array<Real>} vect		(Vec4) The vector from which to extrapolate the component
 * @returns	{Real}
 */
function vec4_get_z(vect) {
	gml_pragma("forceinline");
	
	return vect[Vec4.z];

}


/**
 * Returns the w component of the given vector
 * @param	{Array<Real>} vect		(Vec4) The vector from which to extrapolate the component
 * @returns	{Real}
 */
function vec4_get_w(vect) {
	gml_pragma("forceinline");
	
	return vect[Vec4.w];

}
