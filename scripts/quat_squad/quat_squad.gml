// @author		Giacomo Marton
// @version		1.0.0


/**
 * Compute a point on a path according squad equation
 * @param	{Array<Real>} q1		(Quat) The first control point
 * @param	{Array<Real>} q2		(Quat) The second control point
 * @param	{Array<Real>} s1		(Quat) The first intermediate control point
 * @param	{Array<Real>} s2		(Quat) The second intermediate control point
 * @param	{Real} amount			The amount to interpolate
 * @returns	{Array<Real>}			(Quat)
 */
function quat_squad(q1, q2, s1, s2, amount) {

	//original, functioning code
	//return quat_mix(quat_mix(q1, q2, amount), quat_mix(s1, s2, amount), 2.0 * (1.0 - amount) * amount);
	
	#region first mix
	
	var m1x;
	var m1y;
	var m1z;
	var m1w;
	
	var q1x = q1[Quat.x];
	var q1y = q1[Quat.y];
	var q1z = q1[Quat.z];
	var q1w = q1[Quat.w];

	var q2x = q2[Quat.x];
	var q2y = q2[Quat.y];
	var q2z = q2[Quat.z];
	var q2w = q2[Quat.w];

	var cosTheta =	q1w * q2w +
					q1x * q2x +
					q1y * q2y +
					q1z * q2z;

	// Perform a linear interpolation when cosTheta is close to 1 to avoid side effect of sin(angle) becoming a zero denominator
	if (cosTheta > 1.0 - GMM_epsilon)
	{
		// Linear interpolation
		m1x = q1x + amount * (q2x - q1x);
		m1y = q1y + amount * (q2y - q1y);
		m1z = q1z + amount * (q2z - q1z);
		m1w = q1w + amount * (q2w - q1w);
	}
	else
	{
		var angle = arccos(cosTheta);
		var a = sin((1.0 - amount) * angle);
		var b = sin(amount * angle);
		var c = sin(angle);
	
		m1x = (a * q1x + b * q2x) / c;
		m1y = (a * q1y + b * q2y) / c;
		m1z = (a * q1z + b * q2z) / c;
		m1w = (a * q1w + b * q2w) / c;
	}
	
	#endregion
	
	#region second mix
	
	var m2x;
	var m2y;
	var m2z;
	var m2w;
	
	var s1x = s1[Quat.x];
	var s1y = s1[Quat.y];
	var s1z = s1[Quat.z];
	var s1w = s1[Quat.w];

	var s2x = s2[Quat.x];
	var s2y = s2[Quat.y];
	var s2z = s2[Quat.z];
	var s2w = s2[Quat.w];

	cosTheta =	s1w * s2w +
				s1x * s2x +
				s1y * s2y +
				s1z * s2z;

	// Perform a linear interpolation when cosTheta is close to 1 to avoid side effect of sin(angle) becoming a zero denominator
	if (cosTheta > 1.0 - GMM_epsilon)
	{
		// Linear interpolation
		m2x = s1x + amount * (s2x - s1x);
		m2y = s1y + amount * (s2y - s1y);
		m2z = s1z + amount * (s2z - s1z);
		m2w = s1w + amount * (s2w - s1w);
	}
	else
	{
		var angle = arccos(cosTheta);
		var a = sin((1.0 - amount) * angle);
		var b = sin(amount * angle);
		var c = sin(angle);
	
		m2x = (a * s1x + b * s2x) / c;
		m2y = (a * s1y + b * s2y) / c;
		m2z = (a * s1z + b * s2z) / c;
		m2w = (a * s1w + b * s2w) / c;
	}
	
	#endregion
	
	amount *= 2.0 * (1.0 - amount);
	
	#region mix of mixes
	
	cosTheta =	m1w * m2w +
				m1x * m2x +
				m1y * m2y +
				m1z * m2z;

	// Perform a linear interpolation when cosTheta is close to 1 to avoid side effect of sin(angle) becoming a zero denominator
	if (cosTheta > 1.0 - GMM_epsilon)
	{
		// Linear interpolation
		return [m1x + amount * (m2x - m1x),
				m1y + amount * (m2y - m1y),
				m1z + amount * (m2z - m1z),
				m1w + amount * (m2w - m1w)];
	}
	else
	{
		var angle = arccos(cosTheta);
		var a = sin((1.0 - amount) * angle);
		var b = sin(amount * angle);
		var c = sin(angle);
	
		return [(a * m1x + b * m2x) / c,
				(a * m1y + b * m2y) / c,
				(a * m1z + b * m2z) / c,
				(a * m1w + b * m2w) / c];
	}
	
	#endregion
	
}
