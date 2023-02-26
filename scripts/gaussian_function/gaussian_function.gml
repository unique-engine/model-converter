// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the gaussian function with the input value and constants
 * @param	{Real} val			The input value
 * @param	{Real} a			The height of the curve's 
 * @param	{Real} b			The position of the center of the peak
 * @param	{Real} c			The standard deviation
 * @param	{Real} d			The value that the function asymptotically approaches far from the peak (in practice d is often set to 0)
 * @returns	{Real}
 */
function gaussian_function(val, a, b, c, d) {
	gml_pragma("forceinline");
	
	return a * exp(-(val-b)*(val-b)/(2.0*c*c)) + d;

}
