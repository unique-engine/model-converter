// @author		Giacomo Marton
// @version		1.0.0


/**
 * Calculates the phase angle of the given complex number (in radians)
 * @param	{Array<Real>} complex		(Complex) The complex number
 * @returns	{Real}
 */
function complex_arg(complex) {
	gml_pragma("forceinline");
	
	return arctan2(complex[Complex.i], complex[Complex.r]);

}
