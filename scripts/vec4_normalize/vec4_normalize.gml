// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns a vector in the same direction as <vect> but with length of 1
 * @param	{Array<Real>} vect		(Vec4) The vector to normalize
 * @returns	{Array<Real>}			(Vec4)
 */
function vec4_normalize(vect) {
	gml_pragma("forceinline");
	
	var factor = sqrt(	vect[Vec4.x] * vect[Vec4.x] +
						vect[Vec4.y] * vect[Vec4.y] +
						vect[Vec4.z] * vect[Vec4.z] +
						vect[Vec4.w] * vect[Vec4.w] );
					
	if (factor != 0.0)
	{
		return [vect[Vec4.x] / factor,
				vect[Vec4.y] / factor,
				vect[Vec4.z] / factor,
				vect[Vec4.w] / factor ];
	}

	return vec4_forward;

}

