// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the norm of the given complex number
 * @param	{Array<Real>} complex		(Complex) The complex number
 * @returns	{Real}
 */
function complex_norm(complex) {
	gml_pragma("forceinline");
	
	return sqrt(complex[Complex.r]*complex[Complex.r] + complex[Complex.i]*complex[Complex.i]);

}
