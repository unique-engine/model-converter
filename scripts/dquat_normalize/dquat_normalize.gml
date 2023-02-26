// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns a dual quaternion in the same direction as <dq> but with length of 1
 * @param	{Array<Real>} dq		(DualQuat) The dual quaternion to normalize
 * @returns	{Array<Real>}			(DualQuat)
 */
function dquat_normalize(dq) {
	gml_pragma("forceinline");
	
	var factor = sqrt(	dq[DQuat.rw] * dq[DQuat.rw] +
						dq[DQuat.rx] * dq[DQuat.rx] +
						dq[DQuat.ry] * dq[DQuat.ry] +
						dq[DQuat.rz] * dq[DQuat.rz] );

	if (factor != 0.0)
	{
		factor = 1.0 / factor;
		
		return [dq[DQuat.rx] * factor,
			    dq[DQuat.ry] * factor,
			    dq[DQuat.rz] * factor,
			    dq[DQuat.rw] * factor,
			    dq[DQuat.dx] * factor,
			    dq[DQuat.dy] * factor,
			    dq[DQuat.dz] * factor,
			    dq[DQuat.dw] * factor];
	}

	return [infinity, infinity, infinity, infinity, 
			infinity, infinity, infinity, infinity ];

}
