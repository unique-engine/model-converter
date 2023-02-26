// @author		Giacomo Marton
// @version		1.0.0


/**
 * Calculate the refraction direction for an incident vector
 * @param	{Array<Real>} I		(Vec4) Specifies the incident vector
 * @param	{Array<Real>} N		(Vec4) Specifies the normal vector
 * @param	{Real} eta			Specifies the ratio of indices of refraction
 * @returns	{Array<Real>}		(Vec4)
 * 
 * For a given incident vector I, surface normal N and ratio of indices of refraction, eta, [vec4_refract] returns the refraction vector, R.
 * The input parameters I and N should be normalized in order to achieve the desired result.
 */
function vec4_refract(I, N, eta) {
	gml_pragma("forceinline");
	
	var dt = (I[Vec4.x] * N[Vec4.x] +
			  I[Vec4.y] * N[Vec4.y] +
			  I[Vec4.z] * N[Vec4.z] +
			  I[Vec4.w] * N[Vec4.w]);

	var k = 1.0 - eta * eta * (1.0 - dt * dt);

	if (k < 0.0)
	{
		return vec4_zero;
	}
	else
	{
		k = eta * dt + sqrt(k);
	
		return [eta * I[Vec4.x] - k * N[Vec4.x],
				eta * I[Vec4.y] - k * N[Vec4.y],
				eta * I[Vec4.z] - k * N[Vec4.z],
				eta * I[Vec4.w] - k * N[Vec4.w]];
	}

}
