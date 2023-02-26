// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the interpolation of two inputs by the given amount with an easing function
 * @param	{Real} a			The first value
 * @param	{Real} b			The second value
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function ease_bounce_in(a, b, amount) {
	gml_pragma("forceinline");
	
	amount = 1.0 - amount;
	if(amount < 0.3636363636363636)
	{
		return lerp(b, a, (amount * amount) * 7.5625);
	}
	else if(amount < 0.7272727272727273)
	{
		return lerp(b, a, (9.075 * amount * amount) - (9.9 * amount) + 3.4);
	}
	else if(amount < 0.9)
	{
		return lerp(b, a, (12.06648199445983 * amount * amount) - (19.63545706371191 * amount) + 8.898060941828255);
	}
	else
	{
		return lerp(b, a, (10.8 * amount * amount) - (20.52 * amount) + 10.72);
	}

}


/**
 * Returns the interpolation of two inputs by the given amount with an easing function
 * @param	{Real} a			The first value
 * @param	{Real} b			The second value
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function ease_bounce_out(a, b, amount) {
	gml_pragma("forceinline");
	
	if(amount < 0.3636363636363636)
	{
		return lerp(a, b, (amount * amount) * 7.5625);
	}
	else if(amount < 0.7272727272727273)
	{
		return lerp(a, b, (9.075 * amount * amount) - (9.9 * amount) + 3.4);
	}
	else if(amount < 0.9)
	{
		return lerp(a, b, (12.06648199445983 * amount * amount) - (19.63545706371191 * amount) + 8.898060941828255);
	}
	else
	{
		return lerp(a, b, (10.8 * amount * amount) - (20.52 * amount) + 10.72);
	}

}


/**
 * Returns the interpolation of two inputs by the given amount with an easing function
 * @param	{Real} a			The first value
 * @param	{Real} b			The second value
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function ease_bounce_in_out(a, b, amount) {
	gml_pragma("forceinline");
	
	if ( amount < 0.5 )
	return ease_bounce_in( a, (b-a) * 0.5 + a, amount * 2.0 );

	return ease_bounce_out( (b-a) * 0.5 + a, b, ( amount * 2.0 ) - 1.0 );

}


/**
 * Returns the interpolation of two inputs by the given amount with an easing function
 * @param	{Real} a			The first value
 * @param	{Real} b			The second value
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function ease_bounce_out_in(a, b, amount) {
	gml_pragma("forceinline");
	
	if ( amount < 0.5 )
	return ease_bounce_out( a, (b-a) * 0.5 + a, amount * 2.0 );

	return ease_bounce_in( (b-a) * 0.5 + a, b, ( amount * 2.0 ) - 1.0 );

}
