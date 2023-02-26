// @author		Giacomo Marton
// @version		1.0.0


/**
 * Return a point from a cubic curve
 * @param	{Real} v1			The first point
 * @param	{Real} v2			The second point
 * @param	{Real} v3			The third point
 * @param	{Real} v4			The fourth point
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function spline_cubic(v1, v2, v3, v4, amount) {
	gml_pragma("forceinline");
	
	return ((v1 * amount + v2) * amount + v3) * amount + v4;

}


/**
 * Return a point from a cubic curve
 * @param	{Array<Real>} v1	(Vec2) The first point
 * @param	{Array<Real>} v2	(Vec2) The second point
 * @param	{Array<Real>} v3	(Vec2) The third point
 * @param	{Array<Real>} v4	(Vec2) The fourth point
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Array<Real>}		(Vec2)
 */
function spline_cubic_vec2(v1, v2, v3, v4, amount) {
	gml_pragma("forceinline");
	
	return [((v1[Vec2.x] * amount + v2[Vec2.x]) * amount + v3[Vec2.x]) * amount + v4[Vec2.x],
			((v1[Vec2.y] * amount + v2[Vec2.y]) * amount + v3[Vec2.y]) * amount + v4[Vec2.y] ];

}


/**
 * Return a point from a cubic curve
 * @param	{Array<Real>} v1	(Vec3)The first point
 * @param	{Array<Real>} v2	(Vec3)The second point
 * @param	{Array<Real>} v3	(Vec3)The third point
 * @param	{Array<Real>} v4	(Vec3)The fourth point
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Array<Real>}		(Vec3)
 */
function spline_cubic_vec3(v1, v2, v3, v4, amount) {
	gml_pragma("forceinline");
	
	return [((v1[Vec3.x] * amount + v2[Vec3.x]) * amount + v3[Vec3.x]) * amount + v4[Vec3.x],
			((v1[Vec3.y] * amount + v2[Vec3.y]) * amount + v3[Vec3.y]) * amount + v4[Vec3.y],
			((v1[Vec3.z] * amount + v2[Vec3.z]) * amount + v3[Vec3.z]) * amount + v4[Vec3.z] ];

}


/**
 * Return a point from a cubic curve
 * @param	{Array<Real>} v1	(Vec4) The first point
 * @param	{Array<Real>} v2	(Vec4) The second point
 * @param	{Array<Real>} v3	(Vec4) The third point
 * @param	{Array<Real>} v4	(Vec4) The fourth point
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Array<Real>}		(Vec4)
 */
function spline_cubic_vec4(v1, v2, v3, v4, amount) {
	gml_pragma("forceinline");
	
	return [((v1[Vec4.x] * amount + v2[Vec4.x]) * amount + v3[Vec4.x]) * amount + v4[Vec4.x],
			((v1[Vec4.y] * amount + v2[Vec4.y]) * amount + v3[Vec4.y]) * amount + v4[Vec4.y],
			((v1[Vec4.z] * amount + v2[Vec4.z]) * amount + v3[Vec4.z]) * amount + v4[Vec4.z],
			((v1[Vec4.w] * amount + v2[Vec4.w]) * amount + v3[Vec4.w]) * amount + v4[Vec4.w] ];

}
