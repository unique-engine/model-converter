// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the cross product of <quat_1> and <quat_2>
 * @param	{Array<Real>} quat_1		(Quat) The first quaternion
 * @param	{Array<Real>} quat_2		(Quat) The second quaternion
 * @returns	{Array<Real>}
 */
function quat_cross(quat_1, quat_2) {

	var q1w = quat_1[Quat.w];
	var q1x = quat_1[Quat.x];
	var q1y = quat_1[Quat.y];
	var q1z = quat_1[Quat.z];

	var q2w = quat_2[Quat.w];
	var q2x = quat_2[Quat.x];
	var q2y = quat_2[Quat.y];
	var q2z = quat_2[Quat.z];
	
	return [q1w * q2x + q1x * q2w + q1y * q2z - q1z * q2y,
			q1w * q2y + q1y * q2w + q1z * q2x - q1x * q2z,
			q1w * q2z + q1z * q2w + q1x * q2y - q1y * q2x,
			q1w * q2w - q1x * q2x - q1y * q2y - q1z * q2z];

}
