// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns a vector with each component clamped between the specified minimum and maximum
 * @param	{Array<Real>} vect		(Vec2) The vector to clamp
 * @param	{Real} mn				The minimum value to clamp between
 * @param	{Real} mx				The maximum value to clamp between
 * @returns	{Array<Real>}			(Vec2)
 */
function vec2_clamp(vect, mn, mx) {
	gml_pragma("forceinline");
	
	return [clamp(vect[Vec2.x], mn, mx),
			clamp(vect[Vec2.y], mn, mx)];

}
