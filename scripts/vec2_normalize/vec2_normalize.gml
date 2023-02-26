// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns a vector in the same direction as <vect> but with length of 1
 * @param	{Array<Real>} vect		(Vec2) The vector to normalize
 * @returns	{Array<Real>}			(Vec2)
 */
function vec2_normalize(vect) {
	gml_pragma("forceinline");
	
	var factor = sqrt(	vect[Vec2.x] * vect[Vec2.x] +
						vect[Vec2.y] * vect[Vec2.y] );
					
	if (factor != 0.0)
	{
		return [vect[Vec2.x] / factor,
				vect[Vec2.y] / factor ];
	}

	return vec2_forward;

}
