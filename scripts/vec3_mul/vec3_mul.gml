// @author		Giacomo Marton
// @version		1.0.0


/**
 * Multiply a vector with another
 * @param	{Array<Real>} vect_1	(Vec3) The first vector
 * @param	{Array<Real>} vect_2	(Vec3) The second vector
 * @returns	{Array<Real>}			(Vec3)
 */
function vec3_mul(vect_1, vect_2) {
	gml_pragma("forceinline");
	
	return [vect_1[Vec3.x] * vect_2[Vec3.x],
			vect_1[Vec3.y] * vect_2[Vec3.y],
			vect_1[Vec3.z] * vect_2[Vec3.z] ];

}


/**
 * Multiply a vector with a scalar value
 * @param	{Array<Real>} vect		(Vec3) The vector to multiply
 * @param	{Real} val				The scalar value
 * @returns	{Array<Real>}			(Vec3)
 */
function vec3_mul_scalar(vect, val) {
	gml_pragma("forceinline");
	
	return [vect[Vec3.x] * val,
			vect[Vec3.y] * val,
			vect[Vec3.z] * val ];

}


/*
 * Multiply a Vec3 with a quaternion
 * @param	{Array<Real>} vect		(Vec3) The Vec3
 * @param	{Array<Real>} quat		(Quat) The quaternion to multiply
 * @returns	{Array<Real>}			(Vec3)
 */
function vec3_mul_quat(vect, quat) {
	gml_pragma("forceinline");
	
	var qx = quat[Quat.x];
	var qy = quat[Quat.y];
	var qz = quat[Quat.z];
	var qw = quat[Quat.w];

	var dot = 1.0 / (qw * qw + 
					qx * qx + 
					qy * qy + 
					qz * qz);

	qx *= -dot;
	qy *= -dot;
	qz *= -dot;
	qw *=  dot;

	var vx = vect[Vec3.x];
	var vy = vect[Vec3.y];
	var vz = vect[Vec3.z];

	var uvx = qy * vz - qz * vy;
	var uvy = qz * vx - qx * vz;
	var uvz = qx * vy - qy * vx;

	var uuvx = (qy * uvz - qz * uvy);
	var uuvy = (qz * uvx - qx * uvz);
	var uuvz = (qx * uvy - qy * uvx);

	return [vx + ((uvx * qw) + (qy * uvz - qz * uvy)) * 2.0,
			vy + ((uvy * qw) + (qz * uvx - qx * uvz)) * 2.0,
			vz + ((uvz * qw) + (qx * uvy - qy * uvx)) * 2.0];

}


/*
 * Multiply a Vec3 with a dual quaternion
 * @param	{Array<Real>} vect		(Vec3) The Vec3
 * @param	{Array<Real>} dq		(DQuat) The quaternion to multiply
 * @returns	{Array<Real>}			(Vec3)
 */
function vec3_mul_dquat(vect, dq) {
	gml_pragma("forceinline");
	
	return dquat_mul_vec3(dquat_inverse(dq), vect);

}
