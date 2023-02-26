// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the real part of a complex number
 * @param	{Array<Real>} complex		(Complex) The complex number
 * @returns	{Real}
 */
function complex_get_real(complex) {
	gml_pragma("forceinline");
	
	return complex[Complex.r];

}