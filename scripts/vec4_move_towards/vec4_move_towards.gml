// @author		Giacomo Marton
// @version		1.0.0


/**
 * Moves a point "current" towards "target".
 * @param	{Array<Real>} current		(Vec4) Vector taht specifies the current position
 * @param	{Array<Real>} target		(Vec4) Vector taht specifies the target position
 * @param	{Real} distance			the distance to move
 * @returns	{Array<Real>}				(Vec4)
 * 
 * This is essentially the same as vec4_lerp() but instead the function will ensure that the speed never exceeds the distance.
 * If the current position is already closer to the target than the distance, the value returned is equal to target. The new position does not overshoot target.
 * Negative values of distance pushes the vector away from target.
 */
function vec4_move_towards(current, target, distance) {
	gml_pragma("forceinline");
	
	var dx = target[Vec4.x] - current[Vec4.x];
	var dy = target[Vec4.y] - current[Vec4.y];
	var dz = target[Vec4.z] - current[Vec4.z];
	var dw = target[Vec4.w] - current[Vec4.w];

	var factor = sqrt(dx * dx + dy * dy + dz * dz + dw * dw);

	if (factor == 0.0)
	{
	    return [current[Vec4.x],
				current[Vec4.y],
				current[Vec4.z],
				current[Vec4.w] ];
	}

	var dist = min(factor, distance) / factor;

	return [current[Vec4.x] + dx * dist,
			current[Vec4.y] + dy * dist,
			current[Vec4.z] + dz * dist,
			current[Vec4.w] + dw * dist ];

}
