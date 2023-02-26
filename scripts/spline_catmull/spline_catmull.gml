// @author		Giacomo Marton
// @version		1.0.0


/**
 * Return a point from a catmull rom curve
 * @param	{Real} v1			The first point
 * @param	{Real} v2			The second point
 * @param	{Real} v3			The third point
 * @param	{Real} v4			The fourth point
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function spline_catmull(v1, v2, v3, v4, amount) {
	gml_pragma("forceinline");
	
	var s1 = amount * amount;
	var s2 = s1 * amount;

	var f1 = -s2 + 2.0 * s1 - amount;
	var f2 = 3.0 * s2 - 5.0 * s1 + 2.0;
	var f3 = -3.0 * s2 + 4.0 * s1 + amount;
	var f4 = s2 - s1;

	return (f1 * v1 + f2 * v2 + f3 * v3 + f4 * v4) * 0.5;

}


/**
 * Return a point from a catmull rom curve
 * @param	{Array<Real>} v1	(Vec2) The first point
 * @param	{Array<Real>} v2	(Vec2) The second point
 * @param	{Array<Real>} v3	(Vec2) The third point
 * @param	{Array<Real>} v4	(Vec2) The fourth point
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Array<Real>}		(Vec2)
 */
function spline_catmull_vec2(v1, v2, v3, v4, amount) {
	gml_pragma("forceinline");
	
	var s1 = amount * amount;
	var s2 = s1 * amount;

	var f1 = -s2 + 2.0 * s1 - amount;
	var f2 = 3.0 * s2 - 5.0 * s1 + 2.0;
	var f3 = -3.0 * s2 + 4.0 * s1 + amount;
	var f4 = s2 - s1;

	return [(f1 * v1[Vec2.x] + f2 * v2[Vec2.x] + f3 * v3[Vec2.x] + f4 * v4[Vec2.x]) * 0.5,
			(f1 * v1[Vec2.y] + f2 * v2[Vec2.y] + f3 * v3[Vec2.y] + f4 * v4[Vec2.y]) * 0.5 ];

}


/**
 * Return a point from a catmull rom curve
 * @param	{Array<Real>} v1	(Vec3) The first point
 * @param	{Array<Real>} v2	(Vec3) The second point
 * @param	{Array<Real>} v3	(Vec3) The third point
 * @param	{Array<Real>} v4	(Vec3) The fourth point
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Array<Real>}		(Vec3)
 */
function spline_catmull_vec3(v1, v2, v3, v4, amount) {
	gml_pragma("forceinline");
	
	var s1 = amount * amount;
	var s2 = s1 * amount;

	var f1 = -s2 + 2.0 * s1 - amount;
	var f2 = 3.0 * s2 - 5.0 * s1 + 2.0;
	var f3 = -3.0 * s2 + 4.0 * s1 + amount;
	var f4 = s2 - s1;

	return [(f1 * v1[Vec3.x] + f2 * v2[Vec3.x] + f3 * v3[Vec3.x] + f4 * v4[Vec3.x]) * 0.5,
			(f1 * v1[Vec3.y] + f2 * v2[Vec3.y] + f3 * v3[Vec3.y] + f4 * v4[Vec3.y]) * 0.5,
			(f1 * v1[Vec3.z] + f2 * v2[Vec3.z] + f3 * v3[Vec3.z] + f4 * v4[Vec3.z]) * 0.5 ];

}


/**
 * Return a point from a catmull rom curve
 * @param	{Array<Real>} v1	(Vec4) The first point
 * @param	{Array<Real>} v2	(Vec4) The second point
 * @param	{Array<Real>} v3	(Vec4) The third point
 * @param	{Array<Real>} v4	(Vec4) The fourth point
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Array<Real>}		(Vec4)
 */
function spline_catmull_vec4(v1, v2, v3, v4, amount) {
	gml_pragma("forceinline");
	
	var s1 = amount * amount;
	var s2 = s1 * amount;

	var f1 = -s2 + 2.0 * s1 - amount;
	var f2 = 3.0 * s2 - 5.0 * s1 + 2.0;
	var f3 = -3.0 * s2 + 4.0 * s1 + amount;
	var f4 = s2 - s1;

	return [(f1 * v1[Vec4.x] + f2 * v2[Vec4.x] + f3 * v3[Vec4.x] + f4 * v4[Vec4.x]) * 0.5,
			(f1 * v1[Vec4.y] + f2 * v2[Vec4.y] + f3 * v3[Vec4.y] + f4 * v4[Vec4.y]) * 0.5,
			(f1 * v1[Vec4.z] + f2 * v2[Vec4.z] + f3 * v3[Vec4.z] + f4 * v4[Vec4.z]) * 0.5,
			(f1 * v1[Vec4.w] + f2 * v2[Vec4.w] + f3 * v3[Vec4.w] + f4 * v4[Vec4.w]) * 0.5 ];

}
