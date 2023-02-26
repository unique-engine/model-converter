// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the interpolation of two inputs by the given amount with an easing function
 * @param	{Real} a			The first value
 * @param	{Real} b			The second value
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function ease_quint_in(a, b, amount) {
	gml_pragma("forceinline");
	
	return lerp(a, b, amount * amount * amount * amount * amount);

}


/**
 * Returns the interpolation of two inputs by the given amount with an easing function
 * @param	{Real} a			The first value
 * @param	{Real} b			The second value
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function ease_quint_out(a, b, amount) {
	gml_pragma("forceinline");
	
	var f = (amount - 1.0);
	return lerp(a, b, f * f * f * f * f + 1.0);

}


/**
 * Returns the interpolation of two inputs by the given amount with an easing function
 * @param	{Real} a			The first value
 * @param	{Real} b			The second value
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function ease_quint_in_out(a, b, amount) {
	gml_pragma("forceinline");
	
	if(amount < 0.5)
	{
		return lerp(a, b, 16.0 * amount * amount * amount * amount * amount);
	}
	else
	{
		var f = ((2.0 * amount) - 2.0);
		return lerp(a, b, 0.5 * f * f * f * f * f + 1.0);
	}

}


/**
 * Returns the interpolation of two inputs by the given amount with an easing function
 * @param	{Real} a			The first value
 * @param	{Real} b			The second value
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function ease_quint_out_in(a, b, amount) {
	gml_pragma("forceinline");
	
	if ( amount < 0.5 )
	return ease_quint_out( a, (b-a) * 0.5 + a, amount * 2.0 );

	return ease_quint_in( (b-a) * 0.5 + a, b, ( amount * 2.0 ) - 1.0 );

}

