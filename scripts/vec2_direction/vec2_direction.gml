// @author Giacomo Marton
// @version 1.0.0


/**
 * Returns the direction vector pointing from vect1 to vect2
 * @param {Array<Real>} vect_1		(Vec2) The first vector
 * @param {Array<Real>} vect_2		(Vec2) The second vector
 * @returns {Array<Real>}			(Vec2)
 */
function vec2_direction(vect_1, vect_2) {
	gml_pragma("forceinline");
	
	var dx = vect_2[Vec2.x] - vect_1[Vec2.x];
	var dy = vect_2[Vec2.y] - vect_1[Vec2.y];

	var factor = sqrt(dx * dx + dy * dy);

	if (factor != 0.0)
	{
	    dx /= factor;
	    dy /= factor;
	}

	return [dx, dy];

}
