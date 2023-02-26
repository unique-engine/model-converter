// @author		Giacomo Marton
// @version		1.0.0


/**
 * Calculate the refraction direction for an incident vector
 * @param	{Array<Real>} I		(Vec2) Specifies the incident vector
 * @param	{Array<Real>} N		(Vec2) Specifies the normal vector
 * @param	{Real} eta			Specifies the ratio of indices of refraction
 * @returns	{Array<Real>}		(Vec2)
 * 
 * For a given incident vector I, surface normal N and ratio of indices of refraction, eta, [vec2_refract] returns the refraction vector, R.
 * The input parameters I and N should be normalized in order to achieve the desired result.
 */
function vec2_refract(I, N, eta) {
	gml_pragma("forceinline");
	
	var dt = (I[Vec2.x] * N[Vec2.x] +
			  I[Vec2.y] * N[Vec2.y]);

	var k = 1.0 - eta * eta * (1.0 - dt * dt);

	if (k < 0.0)
	{
		return vec2_zero;
	}
	else
	{
		k = eta * dt + sqrt(k);
		
		return [eta * I[Vec2.x] - k * N[Vec2.x],
				eta * I[Vec2.y] - k * N[Vec2.y]];
	}

}
