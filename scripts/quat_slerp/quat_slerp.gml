// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the spherical linear interpolation of two input quaternions by the given amount
 * @param	{Array<Real>} quat_1	(Quat) The first quaternion
 * @param	{Array<Real>} quat_2	(Quat) The second quaternion
 * @param	{Real} amount			The amount to interpolate
 * @returns	{Array<Real>}			(Quat)
 */
function quat_slerp(quat_1, quat_2, amount) {

	var q1x = quat_1[Quat.x];
	var q1y = quat_1[Quat.y];
	var q1z = quat_1[Quat.z];
	var q1w = quat_1[Quat.w];

	var q2x = quat_2[Quat.x];
	var q2y = quat_2[Quat.y];
	var q2z = quat_2[Quat.z];
	var q2w = quat_2[Quat.w];

	var cosTheta =	q1x * q2x +
					q1y * q2y +
					q1z * q2z +
					q1w * q2w;
				
	// If cosTheta < 0, the interpolation will take the long way around the sphere. 
	// To fix this, one quat must be negated.				
	if (cosTheta < 0.0)
	{
		q2x = -q2x;
		q2y = -q2y;
		q2z = -q2z;
		q2w = -q2w;
		cosTheta = -cosTheta;
	}

	// Perform a linear interpolation when cosTheta is close to 1 to avoid side effect of sin(angle) becoming a zero denominator
	if (cosTheta > GMM_one_minus_epsilon)
	{
		// Linear interpolation
		return [q1x + amount * (q2x - q1x),
				q1y + amount * (q2y - q1y),
				q1z + amount * (q2z - q1z),
				q1w + amount * (q2w - q1w)];
	}
	else
	{
		var angle = arccos(cosTheta);
		var a = sin((1.0 - amount) * angle);
		var b = sin(amount * angle);
		var c = sin(angle);
	
		return [(a * q1x + b * q2x) / c,
				(a * q1y + b * q2y) / c,
				(a * q1z + b * q2z) / c,
				(a * q1w + b * q2w) / c];
	}

}


/*
 * Returns the spherical linear interpolation of two input quaternions by the given amount
 * @param	{Array<Real>} quat_1	(Quat) The first quaternion
 * @param	{Array<Real>} quat_2	(Quat) The second quaternion
 * @param	{Real} amount			The amount to interpolate
 * @returns	{Array<Real>}			(Quat)
 */
function quat_slerp_normalized(quat_1, quat_2, amount) {

	var q1x = quat_1[Quat.x];
	var q1y = quat_1[Quat.y];
	var q1z = quat_1[Quat.z];
	var q1w = quat_1[Quat.w];

	var q2x = quat_2[Quat.x];
	var q2y = quat_2[Quat.y];
	var q2z = quat_2[Quat.z];
	var q2w = quat_2[Quat.w];

	var cosTheta =	q1x * q2x +
					q1y * q2y +
					q1z * q2z +
					q1w * q2w;
				
	// If cosTheta < 0, the interpolation will take the long way around the sphere. 
	// To fix this, one quat must be negated.				
	if (cosTheta < 0.0)
	{
		q2x = -q2x;
		q2y = -q2y;
		q2z = -q2z;
		q2w = -q2w;
		cosTheta = -cosTheta;
	}

	// Perform a linear interpolation when cosTheta is close to 1 to avoid side effect of sin(angle) becoming a zero denominator
	if (cosTheta > GMM_one_minus_epsilon)
	{
		// Linear interpolation
		q1x += amount * (q2x - q1x);
		q1y += amount * (q2y - q1y);
		q1z += amount * (q2z - q1z);
		q1w += amount * (q2w - q1w);
	}
	else
	{
		var angle = arccos(cosTheta);
		var a = sin((1.0 - amount) * angle);
		var b = sin(amount * angle);
		var c = sin(angle);
	
		q1x = (a * q1x + b * q2x) / c;
		q1y = (a * q1y + b * q2y) / c;
		q1z = (a * q1z + b * q2z) / c;
		q1w = (a * q1w + b * q2w) / c;
	}

	var factor = sqrt(	q1x * q1x +
						q1y * q1y +
						q1z * q1z +
						q1w * q1w );

	if (factor != 0.0)
	{
		return [q1x / factor,
				q1y / factor,
				q1z / factor,
				q1w / factor];
	}
	else
	{
	    return [q1x, q1y, q1z, q1w];
	}

}

