// @author		Giacomo Marton
// @version		1.0.0


/**
 * Calculate the refraction direction for an incident vector
 * @param	{Array<Real>} I		(Vec3) Specifies the incident vector
 * @param	{Array<Real>} N		(Vec3) Specifies the normal vector
 * @param	{Real} eta			Specifies the ratio of indices of refraction
 * @returns	{Array<Real>}			(Vec3)
 * 
 * For a given incident vector I, surface normal N and ratio of indices of refraction, eta, [vec3_refract] returns the refraction vector, R.
 * The input parameters I and N should be normalized in order to achieve the desired result.
 */
function vec3_refract(I, N, eta) {
	gml_pragma("forceinline");
	
	var dt = (I[Vec3.x] * N[Vec3.x] +
			  I[Vec3.y] * N[Vec3.y] +
			  I[Vec3.z] * N[Vec3.z]);

	var k = 1.0 - eta * eta * (1.0 - dt * dt);

	if (k < 0.0)
	{
		return vec3_zero;
	}
	else
	{
		k = eta * dt + sqrt(k);
		return [eta * I[Vec3.x] - k * N[Vec3.x],
				eta * I[Vec3.y] - k * N[Vec3.y],
				eta * I[Vec3.z] - k * N[Vec3.z]];
	}

}
