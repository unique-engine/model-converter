// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the quaternion rotation angle (in degrees)
 * @param	{Array<Real>} quat		(Quat) The quaternion
 * @returns	{Real}
 */
function quat_get_rotation_angle(quat) {
	gml_pragma("forceinline");
	
	return darccos(quat[Quat.w]) * 2.0;

}


/**
 * Returns the quaternion rotation axis
 * @param	{Array<Real>} quat		(Quat) The quaternion
 * @returns	{Array<Real>}			(Vec3)
 */
function quat_get_rotation_axis(quat) {
	gml_pragma("forceinline");
	
	var tmp = 1.0 - quat[Quat.w] * quat[Quat.w];
	if(tmp <= 0.0)
	{
		return vec3_up;
	}

	tmp = 1.0 / sqrt(tmp);

	return [quat[Quat.x] * tmp,
			quat[Quat.y] * tmp,
			quat[Quat.z] * tmp];

}
