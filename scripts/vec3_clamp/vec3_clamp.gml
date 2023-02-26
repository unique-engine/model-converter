// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns a vector with each component clamped between the specified minimum and maximum
 * @param	{Array<Real>} vect		(Vec3) The vector to clamp
 * @param	{Real} mn				The minimum value to clamp between
 * @param	{Real} mx				The maximum value to clamp between
 * @returns	{Array<Real>}			(Vec3)
 */
function vec3_clamp(vect, mn, mx) {
	gml_pragma("forceinline");
	
	return [clamp(vect[Vec3.x], mn, mx),
			clamp(vect[Vec3.y], mn, mx),
			clamp(vect[Vec3.z], mn, mx)];

}
