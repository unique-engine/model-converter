// @author		Giacomo Marton
// @version		1.0.0


/**
 * Compares two complex and returns if they are equal
 * @param	{Array<Real>} a		(Complex) The first complex to compare
 * @param	{Array<Real>} b		(Complex) The second complex to compare
 * @returns	{Bool}
 */
function complex_equals(a, b) {
	gml_pragma("forceinline");
	
	return
	a[Complex.i] == b[Complex.i] &&
	a[Complex.r] == b[Complex.r] ;

}
