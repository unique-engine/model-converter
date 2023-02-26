// @author		Giacomo Marton
// @version		1.0.0


/**
 * Moves a point "current" towards "target".
 * @param	{Array<Real>} current			(Vec3)Vector taht specifies the current position
 * @param	{Array<Real>} target			(Vec3)Vector taht specifies the target position
 * @param	{Real} distance		the distance to move
 * @returns	{Array<Real>}					(Vec3)
 * 
 * This is essentially the same as vec3_lerp() but instead the function will ensure that the speed never exceeds max_distance_delta.
 * If the current position is already closer to the target than max_distance_delta, the value returned is equal to target. The new position does not overshoot target.
 * Negative values of max_distance_delta pushes the vector away from target.
 */
function vec3_move_towards(current, target, distance) {
	gml_pragma("forceinline");
	
	var dx = target[Vec3.x] - current[Vec3.x];
	var dy = target[Vec3.y] - current[Vec3.y];
	var dz = target[Vec3.z] - current[Vec3.z];

	var factor = sqrt(dx * dx + dy * dy + dz * dz);

	if (factor == 0.0)
	{
		return [current[Vec3.x],
				current[Vec3.y],
				current[Vec3.z] ];
	}

	var dist = min(factor, distance) / factor;

	return [current[Vec3.x] + dx * dist,
			current[Vec3.y] + dy * dist,
			current[Vec3.z] + dz * dist ];

}
