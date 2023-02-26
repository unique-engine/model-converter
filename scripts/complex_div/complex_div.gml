// @author		Giacomo Marton
// @version		1.0.0

/**
 * Divides two complex numbers and returns the result
 * @param	{Array<Real>} a		(Complex) The first complex number
 * @param	{Array<Real>} b		(Complex) The second complex number
 * @returns	{Array<Real>}		(Complex)
 */
function complex_div(a, b) {
	gml_pragma("forceinline");
	
	var c = b[Complex.r];
	var d = b[Complex.i];
	var ccdd = (c*c + d*d);

	return [(a[Complex.r]*c + a[Complex.i]*d) / ccdd,
			(a[Complex.i]*c + a[Complex.r]*d) / ccdd];

}
