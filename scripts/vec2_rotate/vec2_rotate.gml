// @author		Giacomo Marton
// @version		1.0.0


/**
 * Rotates a vector using a given angle (in degrees)
 * @param	{Array<Real>} vect		(Vec2) The vector to rotate
 * @param	{Real} rot				(Real) The rotation
 * @returns	{Array<Real>}			(Vec2)
 */
function vec2_rotate(vect, rot) {
	gml_pragma("forceinline");
	
	return [vect[Vec3.x] * dcos(rot) - vect[Vec3.y] * dsin(rot),
			vect[Vec3.x] * dsin(rot) + vect[Vec3.y] * dcos(rot)];

}
