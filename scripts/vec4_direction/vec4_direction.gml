// @author Giacomo Marton
// @version 1.0.0


/**
 * Returns the direction vector pointing from vect_1 to vect_2
 * @param {Array<Real>} vect_1		(Vec3) The first vector
 * @param {Array<Real>} vect_2		(Vec3) The second vector
 * @returns {Array<Real>}			(Vec3)
 */
function vec4_direction(vect_1, vect_2) {
	gml_pragma("forceinline");
	
	var dx = vect_2[Vec4.x] - vect_1[Vec4.x];
	var dy = vect_2[Vec4.y] - vect_1[Vec4.y];
	var dz = vect_2[Vec4.z] - vect_1[Vec4.z];
	var dw = vect_2[Vec4.w] - vect_1[Vec4.w];

	var factor = sqrt(dx * dx + dy * dy + dz * dz + dw * dw);

	if (factor != 0.0)
	{
		return [dx/factor, dy/factor, dz/factor, dw/factor];
	}
	
	return [dx, dy, dz, dw];

}
