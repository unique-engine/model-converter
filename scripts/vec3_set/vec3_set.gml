// @author		Giacomo Marton
// @version		1.0.0


/**
 * Creates a three component vector
 * @param	{Real} vx		Component x
 * @param	{Real} vy		Component y
 * @param	{Real} vz		Component z
 * @returns	{Array<Real>}	(Vec3)
 */
function vec3_set(vx, vy, vz) {
	gml_pragma("forceinline");
	
	return [vx, vy, vz];

}
