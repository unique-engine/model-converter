// @author		Giacomo Marton
// @version		1.0.0


/**
 * Creates a complex number with the given real and imaginary part
 * @param	{Real} r			Real part of the complex number
 * @param	{Real} i			Imaginary part of the complex number
 * @returns	{Array<Real>}		(Complex)
 */
function complex_create(r, i) {
	gml_pragma("forceinline");
	
	return [r, i];

}
