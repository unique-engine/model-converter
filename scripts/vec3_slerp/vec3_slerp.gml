// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the spherical linear interpolation of two input vectors by the given amount.
 * 								The given vectors must be normalized
 * @param	{Array<Real>} vect_1		(Vec3) The first vector
 * @param	{Array<Real>} vect_2		(Vec3) The second vector
 * @param	{Real} amount				The amount to interpolate
 * @returns	{Array<Real>}				(Vec3)
 */
function vec3_slerp(vect_1, vect_2, amount) {
	gml_pragma("forceinline");
	
	var v1x = vect_1[Vec3.x];
	var v1y = vect_1[Vec3.y];
	var v1z = vect_1[Vec3.z];

	var v2x = vect_2[Vec3.x];
	var v2y = vect_2[Vec3.y];
	var v2z = vect_2[Vec3.z];

	var dot =	v1x * v2x +
				v1y * v2y +
				v1z * v2z;
	
	var theta = arccos(dot) * amount;
	
	var refVecX = v2x - v1x * dot;
	var refVecY = v2y - v1y * dot;
	var refVecZ = v2z - v1z * dot;
	
	var refFactor = sqrt(refVecX * refVecX +
						 refVecY * refVecY +
						 refVecZ * refVecZ);
	
	if (refFactor != 0.0)
	{
	    refVecX /= refFactor;
	    refVecY /= refFactor;
	    refVecZ /= refFactor;
	}
	var cosTheta = cos(theta);
	var sinTheta = sin(theta);
	
	return [v1x * cosTheta + refVecZ * sinTheta,
			v1y * cosTheta + refVecY * sinTheta,
			v1z * cosTheta + refVecX * sinTheta];
	
}