// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns a quaternion in the same direction as <quat> but with length of 1
 * @param	{Array<Real>} quat		(Quat) The quaternion to normalize
 * @returns	{Array<Real>}			(Quat)
 */
function quat_normalize(quat) {

	var factor = sqrt(	quat[Quat.x] * quat[Quat.x] +
						quat[Quat.y] * quat[Quat.y] +
						quat[Quat.z] * quat[Quat.z] +
						quat[Quat.w] * quat[Quat.w] );

	if (factor != 0.0)
	{
	    return [quat[Quat.x] / factor,
			    quat[Quat.y] / factor,
			    quat[Quat.z] / factor,
			    quat[Quat.w] / factor ];
	}

	return [quat[Quat.x],
			quat[Quat.y],
			quat[Quat.z],
			quat[Quat.w] ];

}
