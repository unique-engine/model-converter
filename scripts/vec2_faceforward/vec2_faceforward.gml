// @author		Giacomo Marton
// @version		1.0.0


/**
 * Return a vector pointing in the same direction as another
 * @param	{Array<Real>} N			(Vec2) Specifies the vector to orient
 * @param	{Array<Real>} I			(Vec2) Specifies the incident vector
 * @param	{Array<Real>} Nref		(Vec2) Specifies the reference vector
 * @returns	{Array<Real>}			(Vec2)
 * 
 * [vec2_faceforward] orients a vector to point away from a surface as defined by its normal. If dot(Nref, I) < 0 [vec4_faceforward] returns N, otherwise it returns -N.
 */
function vec2_faceforward(N, I, Nref) {
	gml_pragma("forceinline");
	
	if	((Nref[Vec2.x] * I[Vec2.x] +
		Nref[Vec2.y] * I[Vec2.y]) < 0.0)
	{
		return [N[Vec2.x],
				N[Vec2.y] ];
	}
	else
	{
		return [-N[Vec2.x],
				-N[Vec2.y] ];
	}

}
