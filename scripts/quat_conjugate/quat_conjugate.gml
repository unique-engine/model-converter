// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the quaternion conjugate
 * @param	{Array<Real>} quat		(Quat) The quaternion from which to calculate the conjugate
 * @returns	{Array<Real>}			(Quat)
 */
function quat_conjugate(quat) {

	return [-quat[Quat.x],
			-quat[Quat.y],
			-quat[Quat.z],
			quat[Quat.w] ];

}
