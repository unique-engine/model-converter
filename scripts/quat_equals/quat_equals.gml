// @author		Giacomo Marton
// @version		1.0.0


/**
 * Compares two quaternions and returns if they are equal
 * @param	{Array<Real>} quat_1		(Quat) The first quaternion to compare
 * @param	{Array<Real>} quat_2		(Quat) The second quaternion to compare
 * @returns	{Bool}
 */
function quat_equals(quat_1, quat_2) {

	return (abs(quat_1[Quat.x] * quat_2[Quat.x] +
				quat_1[Quat.y] * quat_2[Quat.y] +
				quat_1[Quat.z] * quat_2[Quat.z] +
				quat_1[Quat.w] * quat_2[Quat.w])
				>= GMM_one_minus_epsilon);

}
