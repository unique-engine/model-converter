// @author		Giacomo Marton
// @version		1.0.0


/**
 * Calculate the reflection direction for an incident vector
 * @param	{Array<Real>} I		(Vec4) Specifies the incident vector
 * @param	{Array<Real>} N		(Vec4) Specifies the normal vector
 * @returns	{Array<Real>}		(Vec4)
 * 
 * For a given incident vector I and surface normal N [vec4_reflect] returns the reflection direction calculated as I - 2.0 * dot(N, I) * N.
 * N should be normalized in order to achieve the desired result.
 */
function vec4_reflect(I, N) {
	gml_pragma("forceinline");
	
	var dt = 1.0 - (I[Vec4.x] * N[Vec4.x] +
					I[Vec4.y] * N[Vec4.y] +
					I[Vec4.x] * N[Vec4.z] +
					I[Vec4.w] * N[Vec4.w]) * 2.0;

	return [I[Vec4.x] * dt,
			I[Vec4.y] * dt,
			I[Vec4.z] * dt,
			I[Vec4.w] * dt];

}
