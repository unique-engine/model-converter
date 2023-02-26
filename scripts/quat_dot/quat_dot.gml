// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the dot product of <quat_1> and <quat_2>
 * @param	{Array<Real>} quat_1		(Quat) The first quaternion
 * @param	{Array<Real>} quat_2		(Quat) The second quaternion
 * @returns	{Real}
 */
function quat_dot(quat_1, quat_2) {

	return	quat_1[Quat.x] * quat_2[Quat.x] +
			quat_1[Quat.y] * quat_2[Quat.y] +
			quat_1[Quat.z] * quat_2[Quat.z] +
			quat_1[Quat.w] * quat_2[Quat.w];

}
