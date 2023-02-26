// @author Giacomo Marton
// @version 1.0.0


/**
 * Build a quaternion from euler angles in degrees
 * @param {Real} x
 * @param {Real} y
 * @param {Real} z
 * @returns {Array<Real>}		(Quat)
 */
function quat_set_euler(x, y, z) {
	
	var cx = cos(x * ConstNum_half_degtorad);
	var cy = cos(y * ConstNum_half_degtorad);
	var cz = cos(z * ConstNum_half_degtorad);
	
	var sx = sin(x * ConstNum_half_degtorad);
	var sy = sin(y * ConstNum_half_degtorad);
	var sz = sin(z * ConstNum_half_degtorad);
	
    return [cx * sy * cz + sx * cy * sz,
			cx * sy * sz - sx * cy * cz,
			cx * cy * sz - sx * sy * cz,
			cx * cy * cz + sx * sy * sz];

}