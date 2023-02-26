// @author		Giacomo Marton
// @version		1.0.0


/**
 * Sums a quaternion with another
 * @param	{Array<Real>} quat_1		(Quat) The first quaternion
 * @param	{Array<Real>} quat_2		(Quat) The second quaternion
 * @returns	{Array<Real>}				(Quat)
 */
function quat_add(quat_1, quat_2) {
	gml_pragma("forceinline");
	
	quat_1[Quat.w] += quat_2[Quat.w];
	quat_1[Quat.x] += quat_2[Quat.x];
	quat_1[Quat.y] += quat_2[Quat.y];
	quat_1[Quat.z] += quat_2[Quat.z];

	return quat_1;

}
