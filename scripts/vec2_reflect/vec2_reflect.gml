// @author		Giacomo Marton
// @version		1.0.0


/**
 * Calculate the reflection direction for an incident vector
 * @param	{Array<Real>} I		(Vec2) Specifies the incident vector
 * @param	{Array<Real>} N		(Vec2) Specifies the normal vector
 * @returns	{Array<Real>}		(Vec2)
 * 
 * For a given incident vector I and surface normal N [vec2_reflect] returns the reflection direction calculated as I - 2.0 * dot(N, I) * N.
 * N should be normalized in order to achieve the desired result.
 */
function vec2_reflect(I, N) {
	gml_pragma("forceinline");
	
	var dt = 1.0 - (I[Vec2.x] * N[Vec2.x] +
					I[Vec2.y] * N[Vec2.y]) * 2.0;
	
	return [I[Vec2.x]*dt,
			I[Vec2.y]*dt];

}
