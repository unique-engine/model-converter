// @author		Giacomo Marton
// @version		1.0.0


/**
 * Rotates a vector using a quaternion
 * @param	{Array<Real>} vect		(Vec3) The vector to rotate
 * @param	{Array<Real>} quat		(Quat) The rotation
 * @returns	{Array<Real>}			(Vec3)
 */
function vec3_rotate(vect, quat) {
	gml_pragma("forceinline");
	
	var qx = quat[Quat.x];
	var qy = quat[Quat.y];
	var qz = quat[Quat.z];
	var qw = quat[Quat.w];

	var vz = vect[Vec3.z];
	var vy = vect[Vec3.y];
	var vx = vect[Vec3.x];

	var uvx = qy * vz - qz * vy;
	var uvy = qz * vx - qx * vz;
	var uvz = qx * vy - qy * vx;
	
	return [vx + ((uvx * qw) + (qy * uvz - qz * uvy)) * 2.0,
			vy + ((uvy * qw) + (qz * uvx - qx * uvz)) * 2.0,
			vz + ((uvz * qw) + (qx * uvy - qy * uvx)) * 2.0];

}
