// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the interpolation of two inputs by the given amount with an easing function
 * @param	{Real} a			The first value
 * @param	{Real} b			The second value
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function ease_quad_in(a, b, amount) {
	gml_pragma("forceinline");
	
	return lerp(a, b, amount * amount );

}


/**
 * Returns the interpolation of two inputs by the given amount with an easing function
 * @param	{Real} a			The first value
 * @param	{Real} b			The second value
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function ease_quad_out(a, b, amount) {
	gml_pragma("forceinline");
	
	return lerp(a, b, -(amount * (amount - 2.0)) );

}


/**
 * Returns the interpolation of two inputs by the given amount with an easing function
 * @param	{Real} a			The first value
 * @param	{Real} b			The second value
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function ease_quad_in_out(a, b, amount) {
	gml_pragma("forceinline");
	
	if ( amount < 0.5 )
	{
		return lerp(a, b, 2.0 * (amount * amount) );
	}
	else
	{
		return lerp(a, b, (-2.0 * amount * amount) + (4.0 * amount) - 1.0);
	}

}


/**
 * Returns the interpolation of two inputs by the given amount with an easing function
 * @param	{Real} a			The first value
 * @param	{Real} b			The second value
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function ease_quad_out_in(a, b, amount) {
	gml_pragma("forceinline");
	
	if ( amount < 0.5 )
	return ease_quad_out( a, (b-a) * 0.5 + a, amount * 2.0 );

	return ease_quad_in( (b-a) * 0.5 + a, b, ( amount * 2.0 ) - 1.0 );

}
