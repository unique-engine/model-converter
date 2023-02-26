// @author		Giacomo Marton
// @version		1.0.0


/**
 * Converts a quaternion into a matrix
 * @param	{Array<Real>} quat		(Quat)The quaternion to convert
 * @returns	{Array<Real>}			(Mat3)
 */
function quat_to_mat3(quat) {
	gml_pragma("forceinline");
	
	var X = quat[Quat.x];
	var Y = quat[Quat.y];
	var Z = quat[Quat.z];
	var W = quat[Quat.w];
	
	return [1.0 - 2.0*(Y*Y + Z*Z),
			2.0*(X*Y + W*Z),
			2.0*(X*Z - W*Y),
			2.0*(X*Y - W*Z),
			1.0 - 2.0*(X*X + Z*Z),
			2.0*(Y*Z + W*X),
			2.0*(X*Z + W*Y),
			2.0*(Y*Z - W*X),
			1.0 - 2.0*(X*X + Y*Y)];

}


/**
 * Converts a quaternion into a matrix
 * @param	{Array<Real>} quat		(Quat) The quaternion to convert
 * @returns	{Array<Real>}			(Mat4)
 */
function quat_to_mat4(quat) {
	gml_pragma("forceinline");
	
	var X = quat[Quat.x];
	var Y = quat[Quat.y];
	var Z = quat[Quat.z];
	var W = quat[Quat.w];

	return [1.0 - 2.0*(Y*Y + Z*Z),
			2.0 * (X*Y + W*Z),
			2.0 * (X*Z - W*Y),
			0.0,
			2.0 * (X*Y - W*Z),
			1.0 - 2.0*(X*X + Z*Z),
			2.0 * (Y*Z + W*X),
			0.0,
			2.0 * (X*Z + W*Y),
			2.0 * (Y*Z - W*X),
			1.0 - 2.0*(X*X + Y*Y),
			0.0,
			0.0,
			0.0,
			0.0,
			1.0];

}


/**
 * Converts a dual quaternion to a 3x4 matrix.
 * @param	{Array<Real>} dquat		(DualQuat) The dual quaternion to convert
 * @returns	{Array<Real>}			(Mat3x4)
 */
function dquat_to_mat3x4(dquat) {
	gml_pragma("forceinline");
	
	var dqrx = dquat[DQuat.rx];
	var dqry = dquat[DQuat.ry];
	var dqrz = dquat[DQuat.rz];
	var dqrw = dquat[DQuat.rw];
	var dqdx = dquat[DQuat.dx];
	var dqdy = dquat[DQuat.dy];
	var dqdz = dquat[DQuat.dz];
	var dqdw = dquat[DQuat.dw];

	var l2 = 1.0 / (dqrx * dqrx + dqry * dqry + dqrz * dqrz + dqrw * dqrw);

	var rx = dqrx * l2;
	var ry = dqry * l2;
	var rz = dqrz * l2;
	var rw = dqrw * l2;

	var rrx = rx * dqrx * 2.0;
	var rry = ry * dqry * 2.0;
	var rrz = rz * dqrz * 2.0;
	var rrw = rw * dqrw * 2.0;
				
	var xy = rx * dqry;
	var xz = rx * dqrz;
	var yz = ry * dqrz;
	var wx = rw * dqrx;
	var wy = rw * dqry;
	var wz = rw * dqrz;

	return [rrw + rrx - rry - rrz,
			xy - wz,
			xz + wy,
			-(dqdw * rx - dqdx * rw + dqdy * rz - dqdz * ry),
			
			xy + wz,
			rrw + rry - rrx - rrz,
			yz - wx,
			-(dqdw * ry - dqdx * rz - dqdy * rw + dqdz * rx),
			
			xz - wy,
			yz + wx,
			rrw + rrz - rrx - rry,
			-(dqdw * rz + dqdx * ry - dqdy * rx - dqdz * rw)];

}


/**
 * Converts a dual quaternion to a 3x4 matrix.
 * @param	{Array<Real>} dquat		(DualQuat) The dual quaternion to convert
 * @returns	{Array<Real>}				(Mat4)
 */
function dquat_to_mat4(dquat) {
	gml_pragma("forceinline");
	
	var dqrx = dquat[DQuat.rx];
	var dqry = dquat[DQuat.ry];
	var dqrz = dquat[DQuat.rz];
	var dqrw = dquat[DQuat.rw];
	var dqdx = dquat[DQuat.dx];
	var dqdy = dquat[DQuat.dy];
	var dqdz = dquat[DQuat.dz];
	var dqdw = dquat[DQuat.dw];

	var l2 = 1.0 / (dqrx * dqrx + dqry * dqry + dqrz * dqrz + dqrw * dqrw);

	var rx = dqrx * l2;
	var ry = dqry * l2;
	var rz = dqrz * l2;
	var rw = dqrw * l2;

	var rrx = rx * dqrx * 2.0;
	var rry = ry * dqry * 2.0;
	var rrz = rz * dqrz * 2.0;
	var rrw = rw * dqrw * 2.0;
				
	var xy = rx * dqry;
	var xz = rx * dqrz;
	var yz = ry * dqrz;
	var wx = rw * dqrx;
	var wy = rw * dqry;
	var wz = rw * dqrz;

	return [rrw + rrx - rry - rrz,
			xy - wz,
			xz + wy,
			-(dqdw * rx - dqdx * rw + dqdy * rz - dqdz * ry),
			
			xy + wz,
			rrw + rry - rrx - rrz,
			yz - wx,
			-(dqdw * ry - dqdx * rz - dqdy * rw + dqdz * rx),
			
			xz - wy,
			yz + wx,
			rrw + rrz - rrx - rry,
			-(dqdw * rz + dqdx * ry - dqdy * rx - dqdz * rw),
			
			0.0, 0.0, 0.0, 1.0];

}
