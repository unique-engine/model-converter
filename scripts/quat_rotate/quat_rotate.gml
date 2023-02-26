// @author		Giacomo Marton
// @version		1.0.0


/**
 * Rotates a quaternion with the given rotation on the defined axis (in degrees)
 * @param	{Array<Real>} quat		(Quat) The quaternion to rotate
 * @param	{Real} vx				The x component of the axis vector
 * @param	{Real} vy				The y component of the axis vector
 * @param	{Real} vz				The z component of the axis vector
 * @param	{Real} angle			The rotation angle
 * @returns	{Array<Real>}			(Quat)

//The axis defined with x,y,z must be normalized before using this function
 */
function quat_rotate_axis(quat, vx, vy, vz, angle) {
	gml_pragma("forceinline");
	
	var q1w = quat[Quat.w];
	var q1x = quat[Quat.x];
	var q1y = quat[Quat.y];
	var q1z = quat[Quat.z];

	var ang = angle * ConstNum_half_degtorad;

	var Sin = sin(ang);

	var q2w = cos(ang);
	var q2x = Sin * vx;
	var q2y = Sin * vy;
	var q2z = Sin * vz;
	
	return [q2w * q1x + q2x * q1w + q2y * q1z - q2z * q1y,
			q2w * q1y + q2y * q1w + q2z * q1x - q2x * q1z,
			q2w * q1z + q2z * q1w + q2x * q1y - q2y * q1x,
			q2w * q1w - q2x * q1x - q2y * q1y - q2z * q1z ];

}


/**
 * Rotates a quaternion with the given rotation on the x axis (in degrees)
 * @param	{Array<Real>} quat		(Quat) The quaternion to rotate
 * @param	{Real} angle			The rotation angle
 * @returns	{Array<Real>}			(Quat)
 */
function quat_rotate_x(quat, angle) {
	gml_pragma("forceinline");
	
	var q1w = quat[Quat.w];
	var q1x = quat[Quat.x];
	var q1y = quat[Quat.y];
	var q1z = quat[Quat.z];

	var ang = angle * ConstNum_half_degtorad;

	var q2x = sin(ang);
	var q2w = cos(ang);

	return [q2w * q1x + q2x * q1w,
			q2w * q1y - q2x * q1z,
			q2w * q1z + q2x * q1y,
			q2w * q1w - q2x * q1x ];

}


/**
 * Rotates a quaternion with the given rotation on the y axis (in degrees)
 * @param	{Array<Real>} quat		(Quat) The quaternion to rotate
 * @param	{Real} angle			The rotation angle
 * @returns	{Array<Real>}			(Quat)
 */
function quat_rotate_y(quat, angle) {
	gml_pragma("forceinline");
	
	var q1w = quat[Quat.w];
	var q1x = quat[Quat.x];
	var q1y = quat[Quat.y];
	var q1z = quat[Quat.z];

	var ang = angle * ConstNum_half_degtorad;

	var q2y = sin(ang);
	var q2w = cos(ang);

	return [q2w * q1x + q2y * q1z,
			q2w * q1y + q2y * q1w,
			q2w * q1z - q2y * q1x,
			q2w * q1w - q2y * q1y ];

}


/**
 * Rotates a quaternion with the given rotation on the z axis (in degrees)
 * @param	{Array<Real>} quat		(Quat) The quaternion to rotate
 * @param	{Real} angle			The rotation angle
 * @returns	{Array<Real>}			(Quat)
 */
function quat_rotate_z(quat, angle) {
	gml_pragma("forceinline");
	
	var q1w = quat[Quat.w];
	var q1x = quat[Quat.x];
	var q1y = quat[Quat.y];
	var q1z = quat[Quat.z];

	var ang = angle * ConstNum_half_degtorad;

	var q2z = sin(ang);
	var q2w = cos(ang);

	return [q2w * q1x - q2z * q1y,
			q2w * q1y + q2z * q1x,
			q2w * q1z + q2z * q1w,
			q2w * q1w - q2z * q1z ];

}
