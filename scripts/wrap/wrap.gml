// @author		Giacomo Marton
// @version		1.0.0


/**
 * Wraps a value with a range 0/max
 * @param	{Real} maximum		The maximum allowed value
 * @param	{Real} value		The value to wrap
 * @returns	{Real}
 */
function wrap(maximum, value) {
	gml_pragma("forceinline");
	
	return value - maximum * floor(value / maximum);
}


/**
 * Wraps a value with a range
 * @param	{Real} minimum		The minimum allowed value
 * @param	{Real} maximum		The maximum allowed value
 * @param	{Real} value		The value to wrap
 * @returns	{Real}
 */
function wrap_range(minimum, maximum, value) {
	gml_pragma("forceinline");
	
	return value - (maximum-minimum) * floor((value-minimum) / (maximum-minimum));
}


/**
 * Wraps an array of values with a range
 * @param	{Real} minimum				The minimum allowed value
 * @param	{Real} maximum				The maximum allowed value
 * @param	{Array<Real>} values		The value to wrap
 * @returns	{Array<Real>}
 */
function wrap_array(minimum, maximum, values) {
	gml_pragma("forceinline");
	
	var l = array_length(values)-1;
	if (l < 0) return values;
	
	var a;
	a[l] = values[l] - (maximum-minimum) * floor((values[l]-minimum) / (maximum-minimum));
	var i = 0;
	repeat (l)
	{
		a[i++] = values[i] - (maximum-minimum) * floor((values[i]-minimum) / (maximum-minimum));
	}
	
	return a;
}
