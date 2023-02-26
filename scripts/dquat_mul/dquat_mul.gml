// @author		Giacomo Marton
// @version		1.0.0


/**
 * Multiply a dual quaternion with another
 * @param	{Array<Real>} dq_1		(DualQuat) The first dual quaternion
 * @param	{Array<Real>} dq_2		(DualQuat) The second dual quaternion
 * @returns	{Array<Real>}			(DualQuat)
 */
function dquat_mul(dq_1, dq_2) {
	gml_pragma("forceinline");
	
	var prw = dq_1[DQuat.rw];
	var prx = dq_1[DQuat.rx];
	var pry = dq_1[DQuat.ry];
	var prz = dq_1[DQuat.rz];
	var pdw = dq_1[DQuat.dw];
	var pdx = dq_1[DQuat.dx];
	var pdy = dq_1[DQuat.dy];
	var pdz = dq_1[DQuat.dz];

	var orw = dq_2[DQuat.rw];
	var orx = dq_2[DQuat.rx];
	var ory = dq_2[DQuat.ry];
	var orz = dq_2[DQuat.rz];
	var odw = dq_2[DQuat.dw];
	var odx = dq_2[DQuat.dx];
	var ody = dq_2[DQuat.dy];
	var odz = dq_2[DQuat.dz];

	return [prw * orx + prx * orw + pry * orz - prz * ory,
			prw * ory + pry * orw + prz * orx - prx * orz,
			prw * orz + prz * orw + prx * ory - pry * orx,
			prw * orw - prx * orx - pry * ory - prz * orz,
			(prw * odx + prx * odw + pry * odz - prz * ody) + (pdw * orx + pdx * orw + pdy * orz - pdz * ory),
			(prw * ody + pry * odw + prz * odx - prx * odz) + (pdw * ory + pdy * orw + pdz * orx - pdx * orz),
			(prw * odz + prz * odw + prx * ody - pry * odx) + (pdw * orz + pdz * orw + pdx * ory - pdy * orx),
			(prw * odw - prx * odx - pry * ody - prz * odz) + (pdw * orw - pdx * orx - pdy * ory - pdz * orz)];

}


/**
 * Multiply a dual quaternion with a scalar value
 * @param	{Array<Real>} dq	(DualQuat) The dual quaternion to multiply
 * @param	{Real} val			The scalar value
 * @returns	{Array<Real>}		(DualQuat)
 */
function dquat_mul_scalar(dq, val) {

	return [dq[DQuat.rx] * val,
			dq[DQuat.ry] * val,
			dq[DQuat.rz] * val,
			dq[DQuat.rw] * val,
			dq[DQuat.dx] * val,
			dq[DQuat.dy] * val,
			dq[DQuat.dz] * val,
			dq[DQuat.dw] * val];

}


/**
 * Multiply a dual quaternion with a Vec3
 * @param	{Array<Real>} dq	(DualQuat) The dual quaternion to multiply
 * @param	{Array<Real>} v		(Vec3) The vector
 * @returns	{Array<Real>}		(Vec3)
 */
function dquat_mul_vec3(dq, v) {

	var real_v3 = vec3_set(dq[DQuat.rx],dq[DQuat.ry],dq[DQuat.rz]);
	var dual_v3 = vec3_set(dq[DQuat.dx],dq[DQuat.dy],dq[DQuat.dz]);
	var dqrw = dq[DQuat.rw];
	var dqdw = dq[DQuat.dw];
	return vec3_add(
				vec3_mul_scalar(
					vec3_add(
						vec3_cross(
							real_v3,
							vec3_add(
								vec3_add(
									vec3_cross(
										real_v3,
										v
									),
									[v[Vec3.x] * dqrw,
									 v[Vec3.y] * dqrw,
									 v[Vec3.z] * dqrw]
								),
								dual_v3
							)
						),
						[dual_v3[Vec3.x] * dqrw - real_v3[Vec3.x] * dqdw,
						 dual_v3[Vec3.y] * dqrw - real_v3[Vec3.y] * dqdw,
						 dual_v3[Vec3.z] * dqrw - real_v3[Vec3.z] * dqdw]
					),
					2.0
				),
				v
			);

}


/**
 * Multiply a dual quaternion with a Vec4
 * @param	{Array<Real>} dq	(DualQuat) The dual quaternion to multiply
 * @param	{Array<Real>} v		(Vec4) The vector
 * @returns	{Array<Real>}		(Vec4)
 */
function dquat_mul_vec4(dq, v) {

	var v3 = dquat_mul_vec3(dq, vec4_to_vec3(v));
	
	v3[Vec4.w] = v[Vec4.w];

	return v3;

}
