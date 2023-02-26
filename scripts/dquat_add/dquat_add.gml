// @author		Giacomo Marton
// @version		1.0.0


/**
 * Sums a dual quaternion with another
 * @param	{Array<Real>} dq_1		(DualQuat) The first dual quaternion
 * @param	{Array<Real>} dq_2		(DualQuat)The second dual quaternion
 * @returns	{Array<Real>}			(DualQuat)
 */
function dquat_add(dq_1, dq_2) {
	gml_pragma("forceinline");
	
	return [dq_1[DQuat.rx] + dq_2[DQuat.rx],
			dq_1[DQuat.ry] + dq_2[DQuat.ry],
			dq_1[DQuat.rz] + dq_2[DQuat.rz],
			dq_1[DQuat.rw] + dq_2[DQuat.rw],
			dq_1[DQuat.dx] + dq_2[DQuat.dx],
			dq_1[DQuat.dy] + dq_2[DQuat.dy],
			dq_1[DQuat.dz] + dq_2[DQuat.dz],
			dq_1[DQuat.dw] + dq_2[DQuat.dw]];

}
