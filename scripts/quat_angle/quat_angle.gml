// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the angle in degrees between two quaternions
 * @param	{Array<Real>} quat_1	(Quat)
 * @param	{Array<Real>} quat_2	(Quat)
 * @returns	{Real}			(Quat)
 */
function quat_angle(quat_1, quat_2) {

    return darccos (
				min (
					abs(quat_1[Quat.x] * quat_2[Quat.x] +
						quat_1[Quat.y] * quat_2[Quat.y] +
						quat_1[Quat.z] * quat_2[Quat.z] +
						quat_1[Quat.w] * quat_2[Quat.w] ),
					1.0
				)
			) * 2.0;
}
