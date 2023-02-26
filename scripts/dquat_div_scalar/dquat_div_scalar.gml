// @author		Giacomo Marton
// @version		1.0.0


/**
 * Divides a dual quaternion with a scalar value
 * @param	{Array<Real>} dq		(DualQuat) The dual quaternion to multiply
 * @param	{Real} val				The scalar value
 * @returns	{Array<Real>}			(DualQuat)
 */
function dquat_div_scalar(dq, val) {
	gml_pragma("forceinline");
	
	val = 1.0 / val;
	return [dq[DQuat.rx] * val,
			dq[DQuat.ry] * val,
			dq[DQuat.rz] * val,
			dq[DQuat.rw] * val,
			dq[DQuat.dx] * val,
			dq[DQuat.dy] * val,
			dq[DQuat.dz] * val,
			dq[DQuat.dw] * val];

}
