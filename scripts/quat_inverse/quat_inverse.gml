// @author		Giacomo Marton
// @version		1.0.0


/**
 * Inverts the given quaternion
 * @param	{Array<Real>} quat		(Quat) The quaternion to invert
 * @returns	{Array<Real>}			(Quat)
 */
function quat_inverse(quat) {

	var qw = quat[Quat.w];
	var qx = quat[Quat.x];
	var qy = quat[Quat.y];
	var qz = quat[Quat.z];

	var dot =  1.0 / (qw * qw + 
					qx * qx + 
					qy * qy + 
					qz * qz);
	
	return [-qx * dot,
			-qy * dot,
			-qz * dot,
			 qw * dot];

}
