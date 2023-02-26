// @author		Giacomo Marton
// @version		1.0.0


/**

 * Multiply a vector with another
 * @param	{Array<Real>} vect_1		(Vec4) The first vector
 * @param	{Array<Real>} vect_2		(Vec4) The second vector
 * @returns	{Array<Real>}				(Vec4)
 */
function vec4_mul(vect_1, vect_2) {
	gml_pragma("forceinline");
	
	return [vect_1[Vec4.x] * vect_2[Vec4.x],
			vect_1[Vec4.y] * vect_2[Vec4.y],
			vect_1[Vec4.z] * vect_2[Vec4.z],
			vect_1[Vec4.w] * vect_2[Vec4.w] ];

}


/**
 * Multiply a vector with a scalar value
 * @param	{Array<Real>} vect		(Vec4) The vector to multiply
 * @param	{Real} val				The scalar value
 * @returns	{Array<Real>}			(Vec4)
 */
function vec4_mul_scalar(vect, val) {
	gml_pragma("forceinline");
	
	return [vect[Vec4.x] * val,
			vect[Vec4.y] * val,
			vect[Vec4.z] * val,
			vect[Vec4.w] * val ];

}


/**
 * Multiply a Vec4 with a quaternion
 * @param	{Array<Real>} vect		(Vec4) The Vec4
 * @param	{Array<Real>} quat		(QUat) The quaternion to multiply
 * @returns	{Array<Real>}			(Vec4)
 */
function vec4_mul_quat(vect, quat) {
	gml_pragma("forceinline");
	
	var qx = quat[Quat.x];
	var qy = quat[Quat.y];
	var qz = quat[Quat.z];
	var qw = quat[Quat.w];

	var dot = 1.0 / (qx * qx + 
					qy * qy + 
					qz * qz +
					qw * qw );

	qx *= -dot;
	qy *= -dot;
	qz *= -dot;
	qw *=  dot;

	var vx = vect[Vec4.x];
	var vy = vect[Vec4.y];
	var vz = vect[Vec4.z];

	var uvz = qx * vy - qy * vx;
	var uvy = qz * vx - qx * vz;
	var uvx = qy * vz - qz * vy;

	return [vx + ((uvx * qw) + (qy * uvz - qz * uvy)) * 2.0,
			vy + ((uvy * qw) + (qz * uvx - qx * uvz)) * 2.0,
			vz + ((uvz * qw) + (qx * uvy - qy * uvx)) * 2.0,
			vect[Vec4.w] ];

}


/**
 * Multiply a Vec4 with a dual quaternion
 * @param	{Array<Real>} vect		(Vec4) The Vec4
 * @param	{Array<Real>} dq		(DQuat) The quaternion to multiply
 * @returns	{Array<Real>}		(Vec4)
 */
function vec4_mul_dquat(vect, dq) {
	gml_pragma("forceinline");
	
	return dquat_mul_vec4(dquat_inverse(dq), vect);

}
