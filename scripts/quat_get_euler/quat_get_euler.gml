// @author Giacomo Marton
// @version 1.0.0


/**
 * Returns the euler angles from a quaternion in degrees
 * @param {Array<Real>} quat	(Quat) The quaternion from which to get the euler angles
 * @returns {Array<Real>}		(Vec3)
 */
function quat_get_euler(quat) {
	
	var qx = quat[Quat.x];
	var qy = quat[Quat.y];
	var qz = quat[Quat.z];
	var qw = quat[Quat.w];
	
	return [darcsin(2.0 * (qw * qx - qy * qz)),
			darctan2(2.0 * qw * qy + 2.0 * qz * qx, 1.0 - 2.0 * (qx * qx + qy * qy)),
			darctan2(2.0 * qw * qz + 2.0 * qx * qy, 1.0 - 2.0 * (qz * qz + qx * qx))];    
}