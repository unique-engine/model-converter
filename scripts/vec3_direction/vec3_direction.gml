// @author Giacomo Marton
// @version 1.0.0


/**
 * Returns the direction vector pointing from vect1 to vect2
 * @param {Array<Real>} vect_1		(Vec3) The first vector
 * @param {Array<Real>} vect_2		(Vec3) The second vector
 * @returns {Array<Real>}			(Vec3)
 */
function vec3_direction(vect_1, vect_2) {
	gml_pragma("forceinline");
	
	var dx = vect_2[Vec3.x] - vect_1[Vec3.x];
	var dy = vect_2[Vec3.y] - vect_1[Vec3.y];
	var dz = vect_2[Vec3.z] - vect_1[Vec3.z];

	var factor = sqrt(dx * dx + dy * dy + dz * dz);

	if (factor != 0.0)
	{
	    dx /= factor;
	    dy /= factor;
	    dz /= factor;
	}
	
	return [dx, dy, dz];

}
