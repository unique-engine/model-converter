// @author		Giacomo Marton
// @version		1.0.0


/**
 * Return a vector pointing in the same direction as another
 * @param	{Array<Real>} N		(Vec3) Specifies the vector to orient
 * @param	{Array<Real>} I		(Vec3) Specifies the incident vector
 * @param	{Array<Real>} Nref		(Vec3) Specifies the reference vector
 * @returns	{Array<Real>}			(Vec3)
 * 
 * [vec3_faceforward] orients a vector to point away from a surface as defined by its normal. If dot(Nref, I) < 0 [vec4_faceforward] returns N, otherwise it returns -N.
 */
function vec3_faceforward(N, I, Nref) {
	gml_pragma("forceinline");
	
	if	((Nref[Vec3.x] * I[Vec3.x] +
		Nref[Vec3.y] * I[Vec3.y] +
		Nref[Vec3.z] * I[Vec3.z]) < 0.0)
	{
		return [N[Vec3.x],
				N[Vec3.y],
				N[Vec3.z]];
	}
	else
	{
		return [-N[Vec3.x],
				-N[Vec3.y],
				-N[Vec3.z]];
	}

}
