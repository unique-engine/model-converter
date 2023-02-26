// @author		Giacomo Marton
// @version		1.0.0


/**
 * Return a vector pointing in the same direction as another
 * @param	{Array<Real>} N		(Vec4) Specifies the vector to orient
 * @param	{Array<Real>} I		(Vec4) Specifies the incident vector
 * @param	{Array<Real>} Nref		(Vec4) Specifies the reference vector
 * @returns	{Array<Real>}			(Vec4)
 * 
 * [vec4_faceforward] orients a vector to point away from a surface as defined by its normal. If dot(Nref, I) < 0 [vec4_faceforward] returns N, otherwise it returns -N.
 */
function vec4_faceforward(N, I, Nref) {
	gml_pragma("forceinline");
	
	if	((Nref[Vec4.x] * I[Vec4.x] +
		Nref[Vec4.y] * I[Vec4.y] +
		Nref[Vec4.z] * I[Vec4.z] +
		Nref[Vec4.w] * I[Vec4.w]) < 0.0)
	{
		return [N[Vec4.x],
				N[Vec4.y],
				N[Vec4.z],
				N[Vec4.w]];
	}
	else
	{
		return [-N[Vec4.x],
				-N[Vec4.y],
				-N[Vec4.z],
				-N[Vec4.w]];
	}

}
