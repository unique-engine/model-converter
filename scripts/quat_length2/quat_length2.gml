// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the squared length of the given quaternion
 * @param	{Array<Real>} quat		(Quat) Specifies the quaternion of which to calculate the length
 * @returns	{Real}
 */
function quat_length2(quat) {

	return	quat[Quat.w] * quat[Quat.w] + 
	        quat[Quat.x] * quat[Quat.x] + 
	        quat[Quat.y] * quat[Quat.y] + 
	        quat[Quat.z] * quat[Quat.z] ;

}
