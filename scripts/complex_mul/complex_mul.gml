// @author		Giacomo Marton
// @version		1.0.0


/**
 * Multiplies two complex numbers and returns the result
 * @param	{Array<Real>} a		(Complex) The first complex number
 * @param	{Array<Real>} b		(Complex) The second complex number
 * @returns	{Array<Real>}		(Complex)
 */
function complex_mul(a, b) {
	gml_pragma("forceinline");
	
	return [a[Complex.r] * b[Complex.r] - a[Complex.i] * b[Complex.i],
			a[Complex.r] * b[Complex.i] + b[Complex.r] * a[Complex.i]];

}
