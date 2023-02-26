// @author		Giacomo Marton
// @version		1.0.0


/**
 * Calculates the phase angle of the given complex number (in degrees)
 * @param	{Array<Real>} complex		(Complex) The complex number
 * @returns	{Real}
 */
function complex_darg(complex) {
	gml_pragma("forceinline");
	
	return darctan2(complex[Complex.i], complex[Complex.r]);

}
