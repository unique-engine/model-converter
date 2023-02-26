// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns a complex object (in cartesian format) corresponding to the complex number defined by its polar components
 * @param	{Real} rho			Magnitude (modulus) of the complex number
 * @param	{Real} theta		Phase angle (angular component) of the complex number
 * @returns	{Array<Real>}		(Complex)
 */
function complex_polar(rho, theta) {
	gml_pragma("forceinline");
	
	return [rho * cos(theta),
			rho * sin(theta)];

}
