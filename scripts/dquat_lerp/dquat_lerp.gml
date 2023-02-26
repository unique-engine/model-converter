// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the linear interpolation of two input dual quaternions by the given amount
 * @param	{Array<Real>} dq_1		(DualQuat) The first dual quaternion
 * @param	{Array<Real>} dq_2		(DualQuat) The second dual quaternion
 * @param	{Real} amount			The amount to interpolate
 * @returns	{Array<Real>}			(DualQuat)
 */
function dquat_lerp(dq_1, dq_2, amount) {
	gml_pragma("forceinline");
	
	var k;
	if (dq_1[DQuat.rw] * dq_2[DQuat.rw] +
		dq_1[DQuat.rx] * dq_2[DQuat.rx] +
		dq_1[DQuat.ry] * dq_2[DQuat.ry] +
		dq_1[DQuat.rz] * dq_2[DQuat.rz]) < 0.0
	{
		k = -amount;
	}
	else
	{
		k = amount;
	}

	var k2 = 1.0 - amount;
	
	return [dq_1[DQuat.rx] * k2 + dq_2[DQuat.rx] * k,
			dq_1[DQuat.ry] * k2 + dq_2[DQuat.ry] * k,
			dq_1[DQuat.rz] * k2 + dq_2[DQuat.rz] * k,
			dq_1[DQuat.rw] * k2 + dq_2[DQuat.rw] * k,
			dq_1[DQuat.dx] * k2 + dq_2[DQuat.dx] * k,
			dq_1[DQuat.dy] * k2 + dq_2[DQuat.dy] * k,
			dq_1[DQuat.dz] * k2 + dq_2[DQuat.dz] * k,
			dq_1[DQuat.dw] * k2 + dq_2[DQuat.dw] * k];

}
