// @author		Giacomo Marton
// @version		1.0.0


/**
 * Converts a Vec4 into a Vec2
 * @param	{Array<Real>} vect		(Vec4) The vector to convert
 * @returns	{Array<Real>}			(Vec2)
 */
function vec4_to_vec2(vect) {
	gml_pragma("forceinline");
	
	return [vect[Vec3.x],
			vect[Vec3.y] ];

}


/**
 * Converts a Vec4 into a Vec3
 * @param	{Array<Real>} vect		(Vec4) The vector to convert
 * @returns	{Array<Real>}			(Vec3)
 */
function vec4_to_vec3(vect) {
	gml_pragma("forceinline");
	
	return [vect[Vec3.x],
			vect[Vec3.y],
			vect[Vec3.z] ];

}


/**
 * Converts a Vec3 into a Vec2
 * @param	{Array<Real>} vect		(Vec3) The vector to convert
 * @returns	{Array<Real>}		(Vec2)
 */
function vec3_to_vec2(vect) {
	gml_pragma("forceinline");
	
	return [vect[Vec3.x],
			vect[Vec3.y] ];

}


/**
 * Converts a Vec3 into a Vec4
 * @param	{Array<Real>} vect		(Vec3) The vector to convert
 * @param	{Real} w				The w factor to add
 * @returns	{Array<Real>}			(Vec4)
 */
function vec3_to_vec4(vect, w) {
	gml_pragma("forceinline");
	
	return [vect[Vec3.x],
			vect[Vec3.y],
			vect[Vec3.z],
			w ];

}


/**
 * Converts a Vec2 into a Vec3
 * @param	{Array<Real>} vect		(Vec2) The vector to convert
 * @param	{Real} z				The z factor to add
 * @returns	{Array<Real>}			(Vec3)
 */
function vec2_to_vec3(vect, z) {
	gml_pragma("forceinline");
	
	return [vect[Vec2.x],
			vect[Vec2.y],
			z];

}


/**
 * Converts a Vec2 into a Vec4
 * @param	{Array<Real>} vect		(Vec2) The vector to convert
 * @param	{Real} z				The z factor to add
 * @param	{Real} w				The w factor to add
 * @returns	{Array<Real>}			(Vec4)
 */
function vec2_to_vec4(vect, z, w) {
	gml_pragma("forceinline");
	
	return [vect[Vec2.x],
			vect[Vec2.y],
			z,
			w];

}
