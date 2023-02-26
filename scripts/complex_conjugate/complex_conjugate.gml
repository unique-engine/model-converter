// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the conjugate of the given complex number
 * @param	{Array<Real>} complex		(Complex) The complex number
 * @returns	{Array<Real>}				(Complex)
 */
function complex_conjugate(complex) {
	gml_pragma("forceinline");
	
	return [ complex[Complex.r], -complex[Complex.i] ];

}
