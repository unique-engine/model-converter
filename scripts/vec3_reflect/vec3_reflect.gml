// @author		Giacomo Marton
// @version		1.0.0


/**
 * Calculate the reflection direction for an incident vector
 * @param	{Array<Real>} I		(Vec3) Specifies the incident vector
 * @param	{Array<Real>} N		(Vec3) Specifies the normal vector
 * @returns	{Array<Real>}		(Vec3)
 * 
 * For a given incident vector I and surface normal N [vec3_reflect] returns the reflection direction calculated as I - 2.0 * dot(N, I) * N.
 * N should be normalized in order to achieve the desired result.
 */
function vec3_reflect(I, N) {
	gml_pragma("forceinline");
	
	var dt = 1.0 - (I[Vec3.x] * N[Vec3.x] +
					I[Vec3.y] * N[Vec3.y] +
					I[Vec3.x] * N[Vec3.z]) * 2.0;

	return [I[Vec3.x] * dt,
			I[Vec3.y] * dt,
			I[Vec3.z] * dt];

}
