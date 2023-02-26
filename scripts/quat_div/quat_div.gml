// @author		Giacomo Marton
// @version		1.0.0


/**
 * Divides a quaternion with another
 * @param	{Array<Real>} quat_1		(Quat)The first quaternion
 * @param	{Array<Real>} quat_2		(Quat)The second quaternion
 * @returns	{Array<Real>}				(Quat)
 */
function quat_div(quat_1, quat_2) {
	gml_pragma("forceinline");
	
	var q1w = quat_1[Quat.w];
	var q1x = quat_1[Quat.x];
	var q1y = quat_1[Quat.y];
	var q1z = quat_1[Quat.z];

	var q2w = quat_2[Quat.w];
	var q2x = quat_2[Quat.x];
	var q2y = quat_2[Quat.y];
	var q2z = quat_2[Quat.z];

	var norm =	q2w * q2w +
				q2x * q2x +
				q2y * q2y +
				q2z * q2z;
	
	return [(q2w * q1x - q2x * q1w - q2y * q1z + q2z * q1y) / norm,
			(q2w * q1y + q2x * q1z - q2y * q1w - q2z * q1x) / norm,
			(q2w * q1z - q2x * q1y + q2y * q1x - q2z * q1w) / norm,
			(q2w * q1w + q2x * q1x + q2y * q1y + q2z * q1z) / norm];

}


/**
 * Divide a quaternion with a scalar value
 * @param	{Array<Real>} quat		(Quat) The quaternion to divide
 * @param	{Real} val				The scalar value
 * @returns	{Array<Real>}			(Quat)
 */
function quat_div_scalar(quat, val) {
	gml_pragma("forceinline");
	
	quat[Quat.w] /= val;
	quat[Quat.x] /= val;
	quat[Quat.y] /= val;
	quat[Quat.z] /= val;

	return quat;

}
