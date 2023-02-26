// @author		Giacomo Marton
// @version		1.0.0


/**
 * Return a point from a hermite curve
 * @param	{Real} v1			The first point
 * @param	{Real} t1			The first tangent
 * @param	{Real} v2			The second point
 * @param	{Real} t2			The second tangent
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Real}
 */
function spline_hermite(v1, t1, v2, t2, amount) {
	gml_pragma("forceinline");
	
	var s1 = amount * amount;
	var s2 = s1 * amount;


	var f1 = 2.0 * s2 - 3.0 * s1 + 1.0;
	var f2 = -2.0 * s2 + 3.0 * s1 + amount;
	var f3 = s2 - 2.0 * s1 + amount;
	var f4 = s2 - s1;

	return f1 * v1 + f2 * v2 + f3 * t1 + f4 * t2;

}


/**
 * Return a point from a hermite curve
 * @param	{Array<Real>} v1	(Vec2) The first point
 * @param	{Array<Real>} t1	(Vec2) The first tangent
 * @param	{Array<Real>} v2	(Vec2) The second point
 * @param	{Array<Real>} t2	(Vec2) The second tangent
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Array<Real>}		(Vec2)
 */
function spline_hermite_vec2(v1, t1, v2, t2, amount) {
	gml_pragma("forceinline");
	
	var s1 = amount * amount;
	var s2 = s1 * amount;

	var f1 = 2.0 * s2 - 3.0 * s1 + 1.0;
	var f2 = -2.0 * s2 + 3.0 * s1 + amount;
	var f3 = s2 - 2.0 * s1 + amount;
	var f4 = s2 - s1;

	return [f1 * v1[Vec2.x] + f2 * v2[Vec2.x] + f3 * t1[Vec2.x] + f4 * t2[Vec2.x],
			f1 * v1[Vec2.y] + f2 * v2[Vec2.y] + f3 * t1[Vec2.y] + f4 * t2[Vec2.y] ];

}


/**
 * Return a point from a hermite curve
 * @param	{Array<Real>} v1	(vec3) The first point
 * @param	{Array<Real>} t1	(vec3) The first tangent
 * @param	{Array<Real>} v2	(vec3) The second point
 * @param	{Array<Real>} t2	(vec3) The second tangent
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Array<Real>}		(Vec3)
 */
function spline_hermite_vec3(v1, t1, v2, t2, amount) {
	gml_pragma("forceinline");
	
	var s1 = amount * amount;
	var s2 = s1 * amount;

	var f1 = 2.0 * s2 - 3.0 * s1 + 1.0;
	var f2 = -2.0 * s2 + 3.0 * s1 + amount;
	var f3 = s2 - 2.0 * s1 + amount;
	var f4 = s2 - s1;

	var vect;

	return [f1 * v1[Vec3.x] + f2 * v2[Vec3.x] + f3 * t1[Vec3.x] + f4 * t2[Vec3.x],
			f1 * v1[Vec3.y] + f2 * v2[Vec3.y] + f3 * t1[Vec3.y] + f4 * t2[Vec3.y],
			f1 * v1[Vec3.z] + f2 * v2[Vec3.z] + f3 * t1[Vec3.z] + f4 * t2[Vec3.z] ];

}


/**
 * Return a point from a hermite curve
 * @param	{Array<Real>} v1	(Vec4) The first point
 * @param	{Array<Real>} t1	(Vec4) The first tangent
 * @param	{Array<Real>} v2	(Vec4) The second point
 * @param	{Array<Real>} t2	(Vec4) The second tangent
 * @param	{Real} amount		The amount to interpolate
 * @returns	{Array<Real>}		(Vec4)
 */
function spline_hermite_vec4(v1, t1, v2, t2, amount) {
	gml_pragma("forceinline");
	
	var s1 = amount * amount;
	var s2 = s1 * amount;


	var f1 = 2.0 * s2 - 3.0 * s1 + 1.0;
	var f2 = -2.0 * s2 + 3.0 * s1 + amount;
	var f3 = s2 - 2.0 * s1 + amount;
	var f4 = s2 - s1;

	var vect;

	return [f1 * v1[Vec4.x] + f2 * v2[Vec4.x] + f3 * t1[Vec4.x] + f4 * t2[Vec4.x],
			f1 * v1[Vec4.z] + f2 * v2[Vec4.z] + f3 * t1[Vec4.z] + f4 * t2[Vec4.z],
			f1 * v1[Vec4.y] + f2 * v2[Vec4.y] + f3 * t1[Vec4.y] + f4 * t2[Vec4.y],
			f1 * v1[Vec4.w] + f2 * v2[Vec4.w] + f3 * t1[Vec4.w] + f4 * t2[Vec4.w] ];

}
