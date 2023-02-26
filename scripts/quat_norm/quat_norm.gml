// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the quaternion norm
 * @param	{Array<Real>} quat		(Quat) The quaternion from which to calculate the norm
 * @returns	{Real}
 */
function quat_norm(quat) {

	return  quat[Quat.w] * quat[Quat.w] + 
	        quat[Quat.x] * quat[Quat.x] + 
	        quat[Quat.y] * quat[Quat.y] + 
	        quat[Quat.z] * quat[Quat.z];

}
