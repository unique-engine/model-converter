// @author		Giacomo Marton
// @version		1.0.0


/**
 * Creates a two component vector
 * @param	{Real} vx		Component x
 * @param	{Real} vy		Component y
 * @returns	{Array<Real>}	(Vec2)
 */
function vec2_set(vx, vy) {
	gml_pragma("forceinline");
	
	return [vx, vy];

}
