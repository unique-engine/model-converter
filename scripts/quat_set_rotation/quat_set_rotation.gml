// @author		Giacomo Marton
// @version		1.0.0


/**
 * Creates a quaternion with the given rotation on the defined axis (in degrees)
 * @param	{Real} vx				The x component of the axis vector
 * @param	{Real} vy				The y component of the axis vector
 * @param	{Real} vz				The z component of the axis vector
 * @param	{Real} angle			The rotation angle
 * @returns	{Array<Real>}			(Quat)

//The axis defined with x,y,z must be normalized before using this function
 */
function quat_set_rotation_axis(vx, vy, vz, angle) {
	gml_pragma("forceinline");
	
	var ang = angle * ConstNum_half_degtorad;

	var Sin = sin(ang);
	
	return[ Sin * vx,
			Sin * vy,
			Sin * vz,
			cos(ang)];

}


/**
 * Creates a quaternion with the given rotation on the x axis (in degrees)
 * @param	{Real} angle		The rotation angle
 * @returns	{Array<Real>}		(Quat)
 */
function quat_set_rotation_x(angle) {
	gml_pragma("forceinline");
	
	var ang = angle * ConstNum_half_degtorad;

	return [sin(ang),
			0.0,
			0.0,
			cos(ang)];

}


/**
 * Creates a quaternion with the given rotation on the y axis (in degrees)
 * @param	{Real} angle		The rotation angle
 * @returns	{Array<Real>}		(Quat)
 */
function quat_set_rotation_y(angle) {
	gml_pragma("forceinline");
	
	var ang = angle * ConstNum_half_degtorad;
	
	return [0.0,
			sin(ang),
			0.0,
			cos(ang)];

}


/**
 * Creates a quaternion with the given rotation on the z axis (in degrees)
 * @param	{Real} angle		The rotation angle
 * @returns	{Array<Real>}		(Quat)
 */
function quat_set_rotation_z(angle) {
	gml_pragma("forceinline");
	
	var ang = angle * ConstNum_half_degtorad;

	return [0.0,
			0.0,
			sin(ang),
			cos(ang)];

}
