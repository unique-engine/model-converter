// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns a vector with each component clamped between the specified minimum and maximum
 * @param	{Array<Real>} vect		(Vec4) The vector to clamp
 * @param	{Real} mn				The minimum value to clamp between
 * @param	{Real} mx				The maximum value to clamp between
 * @returns	{Array<Real>}			(Vec4)
 */
function vec4_clamp(vect, mn, mx) {
	gml_pragma("forceinline");
	
	return [clamp(vect[Vec4.x], mn, mx),
			clamp(vect[Vec4.y], mn, mx),
			clamp(vect[Vec4.z], mn, mx),
			clamp(vect[Vec4.w], mn, mx)];

}
