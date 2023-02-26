// @author		Giacomo Marton
// @version		1.0.0


/**
 * Inverts the given dual quaternion
 * @param	{Array<Real>} dq		(DualQuat) The dual quaternion to invert
 * @returns	{Array<Real>}			(DualQuat)
 */
function dquat_inverse(dq) {
	gml_pragma("forceinline");
	
	var dqrx = -dq[DQuat.rx];
	var dqry = -dq[DQuat.ry];
	var dqrz = -dq[DQuat.rz];
	var dqrw =  dq[DQuat.rw];
	var dqdx = -dq[DQuat.dx];
	var dqdy = -dq[DQuat.dy];
	var dqdz = -dq[DQuat.dz];
	var dqdw =  dq[DQuat.dw];

	var dt = (dqrw * dqdw +
			  dqrx * dqdx +
			  dqry * dqdy +
			  dqrz * dqdz ) * (-2.0);

	return [dqrx,
			dqry,
			dqrz,
			dqrw,
			dqdx + dqrx * dt,
			dqdy + dqry * dt,
			dqdz + dqrz * dt,
			dqdw + dqrw * dt];

}
