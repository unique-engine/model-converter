// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the interpolation of two inputs by the given amount with an easing function
 * @param	{Real} a			The first value
 * @param	{Real} b			The second value
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function ease_elastic_in(a, b, amount) {
	gml_pragma("forceinline");
	
	return lerp(a, b, sin(13.0 * 1.57079632679 * amount) * power(2.0, 10.0 * (amount - 1.0)) );

}


/**
 * Returns the interpolation of two inputs by the given amount with an easing function
 * @param	{Real} a			The first value
 * @param	{Real} b			The second value
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function ease_elastic_out(a, b, amount) {
	gml_pragma("forceinline");
	
	return lerp(a, b, sin(-13.0 * 1.57079632679 * (amount + 1.0)) * power(2.0, -10.0 * amount) + 1.0 );

}


/**
 * Returns the interpolation of two inputs by the given amount with an easing function
 * @param	{Real} a			The first value
 * @param	{Real} b			The second value
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function ease_elastic_in_out(a, b, amount) {
	gml_pragma("forceinline");
	
	if(amount < 0.5)
	{
		return lerp(a, b, 0.5 * sin(13.0 * 1.57079632679 * (2.0 * amount)) * power(2.0, 10.0 * ((2.0 * amount) - 1.0)) );
	}
	else
	{
		return lerp(a, b, 0.5 * (sin(-13.0 * 1.57079632679 * ((2.0 * amount - 1.0) + 1.0)) * power(2.0, -10.0 * (2.0 * amount - 1.0)) + 2.0) );
	}

}


/**
 * Returns the interpolation of two inputs by the given amount with an easing function
 * @param	{Real} a			The first value
 * @param	{Real} b			The second value
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function ease_elastic_out_in(a, b, amount) {
	gml_pragma("forceinline");
	
	if ( amount < 0.5 )
	return ease_elastic_out( a, (b-a) * 0.5 + a, amount * 2.0 );

	return ease_elastic_in( (b-a) * 0.5 + a, b, ( amount * 2.0 ) - 1.0 );

}
