// @author		Giacomo Marton
// @version		1.0.0


/**
 * Creates a four component vector
 * @param	{Real} vx		Component x
 * @param	{Real} vy		Component y
 * @param	{Real} vz		Component z
 * @param	{Real} vw		Component w
 * @returns	{Array<Real>}	(Vec4)
 */
function vec4_set(vx, vy, vz, vw) {
	gml_pragma("forceinline");
	
	return [vx, vy, vz, vw];

}


/**
 * Creates a four component direction vector
 * @param	{Real} vx		Component x
 * @param	{Real} vy		Component y
 * @param	{Real} vz		Component z
 * @returns	{Array<Real>}	(Vec4)
 */
function vec4_set_direction(vx, vy, vz) {
	gml_pragma("forceinline");
	
	return [vx, vy, vz, 0.0];

}


/**
 * Creates a four component position vector
 * @param	{Real} vx		Component x
 * @param	{Real} vy		Component y
 * @param	{Real} vz		Component z
 * @returns	{Array<Real>}	(Vec4)
 */
function vec4_set_position(vx, vy, vz) {
	gml_pragma("forceinline");
	
	return [vx, vy, vz, 1.0];

}

