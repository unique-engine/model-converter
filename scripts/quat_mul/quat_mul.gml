// @author		Giacomo Marton
// @version		1.0.0


/**
 * Multiply a quaternion with another
 * @param	{Array<Real>} quat_1	(Quat) The first quaternion
 * @param	{Array<Real>} quat_2	(Quat) The second quaternion
 * @returns	{Array<Real>}			(Quat)
 */
function quat_mul(quat_1, quat_2) {
	gml_pragma("forceinline");
	
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


/**
 * Multiply a quaternion with a scalar value
 * @param	{Array<Real>} quat		(Quat) The quaternion to multiply
 * @param	{Real} val				The scalar value
 * @returns	{Array<Real>}			(Quat)
 */
function quat_mul_scalar(quat, val) {
	gml_pragma("forceinline");
	
	return [quat[Quat.x] * val,
			quat[Quat.y] * val,
			quat[Quat.z] * val,
			quat[Quat.w] * val];

}


/**
 * Multiply a quaternion with a Vec3
 * @param	{Array<Real>} quat		(Quat) The quaternion to multiply
 * @param	{Array<Real>} vect		(Vec3) The vector
 * @returns	{Array<Real>}			(Vec3)
 */
function quat_mul_vec3(quat, vect) {
	gml_pragma("forceinline");
	
	var qw = quat[Quat.w];
	var qz = quat[Quat.z];
	var qy = quat[Quat.y];
	var qx = quat[Quat.x];

	var vz = vect[Vec3.z];
	var vy = vect[Vec3.y];
	var vx = vect[Vec3.x];

	var uvz = qx * vy - qy * vx;
	var uvy = qz * vx - qx * vz;
	var uvx = qy * vz - qz * vy;


	var uuvz = qx * uvy - qy * uvx;
	var uuvy = qz * uvx - qx * uvz;
	var uuvx = qy * uvz - qz * uvy;

	return [vx + ((uvx * qw) + uuvx) * 2.0,
			vy + ((uvy * qw) + uuvy) * 2.0,
			vz + ((uvz * qw) + uuvz) * 2.0];

}


/**
 * Multiply a quaternion with a Vec4
 * @param	{Array<Real>} quat		(Quat) The quaternion to multiply
 * @param	{Array<Real>} vect		(Vec4) The vector
 * @returns	{Array<Real>}			(Vec4)
 */
function quat_mul_vec4(quat, vect) {
	gml_pragma("forceinline");
	
	var qw = quat[Quat.w];
	var qz = quat[Quat.z];
	var qy = quat[Quat.y];
	var qx = quat[Quat.x];

	var vz = vect[Vec4.z];
	var vy = vect[Vec4.y];
	var vx = vect[Vec4.x];

	var uvz = qx * vy - qy * vx;
	var uvy = qz * vx - qx * vz;
	var uvx = qy * vz - qz * vy;

	var uuvz = qx * uvy - qy * uvx;
	var uuvy = qz * uvx - qx * uvz;
	var uuvx = qy * uvz - qz * uvy;
	
	return [vx + ((uvx * qw) + uuvx) * 2.0,
			vy + ((uvy * qw) + uuvy) * 2.0,
			vz + ((uvz * qw) + uuvz) * 2.0,
			vect[Vec4.w] ];

}

