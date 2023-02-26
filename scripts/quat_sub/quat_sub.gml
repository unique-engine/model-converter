// @author		Giacomo Marton
// @version		1.0.0


/**
 * Subtracts a quaternion with another
 * @param	{Array<Real>} quat_1	(Quat) The first quaternion
 * @param	{Array<Real>} quat_2	(Quat) The second quaternion
 * @returns	{Array<Real>}			(Quat)
 */
function quat_sub(quat_1, quat_2) {
	gml_pragma("forceinline");
	
	return [quat_1[Quat.x] - quat_2[Quat.x],
			quat_1[Quat.y] - quat_2[Quat.y],
			quat_1[Quat.z] - quat_2[Quat.z],
			quat_1[Quat.w] - quat_2[Quat.w] ];

}
