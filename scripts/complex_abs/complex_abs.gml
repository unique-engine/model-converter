// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the absolute value of the given complex number
 * @param	{Array<Real>} complex		(Complex) The complex number
 * @returns	{Real}
 */
function complex_abs(complex) {
	gml_pragma("forceinline");
	
	return complex[Complex.r]*complex[Complex.r] + complex[Complex.i]*complex[Complex.i];

}
