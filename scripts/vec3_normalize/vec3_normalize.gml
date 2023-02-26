// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns a vector in the same direction as <vect> but with length of 1
 * @param	{Array<Real>} vect		(Vec3) The vector to normalize
 * @returns	{Array<Real>}			(Vec3)
 */
function vec3_normalize(vect) {
	gml_pragma("forceinline");
	
	var factor = sqrt(	vect[Vec3.x] * vect[Vec3.x] +
						vect[Vec3.y] * vect[Vec3.y] +
						vect[Vec3.z] * vect[Vec3.z] );
					
	if (factor != 0.0)
	{
		return [vect[Vec3.x] / factor,
				vect[Vec3.y] / factor,
				vect[Vec3.z] / factor ];
	}

	return vec3_forward;

}
