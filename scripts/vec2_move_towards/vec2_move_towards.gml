// @author		Giacomo Marton
// @version		1.0.0


/**
 * Moves a point "current" towards "target".
 * @param	{Array<Real>} current		(Vec2) Vector taht specifies the current position
 * @param	{Array<Real>} target		(Vec2) Vector taht specifies the target position
 * @param	{Real} distance			the distance to move
 * @returns	{Array<Real>}				(Vec2)
 * 
 * This is essentially the same as vec2_lerp() but instead the function will ensure that the speed never exceeds max_distance_delta.
 * If the current position is already closer to the target than max_distance_delta, the value returned is equal to target. The new position does not overshoot target.
 * Negative values of max_distance_delta pushes the vector away from target.
 */
function vec2_move_towards(current, target, distance) {
	gml_pragma("forceinline");
	
	var dx = target[Vec2.x] - current[Vec2.x];
	var dy = target[Vec2.y] - current[Vec2.y];

	var factor = sqrt(dx * dx + dy * dy);

	if (factor == 0.0)
	{
		return [current[Vec2.x],
				current[Vec2.y] ];
	}

	var dist = min(factor, distance) / factor;

	return [current[Vec2.x] + dx * dist,
			current[Vec2.y] + dy * dist ];

}
