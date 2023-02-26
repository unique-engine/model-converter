// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns a rotation with the specified forward direction and up vector.
 * @param	{Array<Real>} forward	(Vec3) The direction vector
 * @param	{Array<Real>} up		(Vec3) The up vector
 * @returns	{Array<Real>}			(Quat)
 */
function quat_lookat(forward, up) {
	gml_pragma("forceinline");
	
	forward = vec3_normalize(forward);
	var right = vec3_normalize(vec3_cross(up, forward))
	up = vec3_cross(forward, right)
	
	var m00 = right[Vec3.x];
	var m01 = right[Vec3.y];
	var m02 = right[Vec3.z];
	var m10 = up[Vec3.x];
	var m11 = up[Vec3.y];
	var m12 = up[Vec3.z];
	var m20 = forward[Vec3.x];
	var m21 = forward[Vec3.y];
	var m22 = forward[Vec3.z];

	var num8 = (m00 + m11) + m22;
	var num1, num2;
	if (num8 > 0.0) {
		num1 = sqrt(num8 + 1.0);
		num2 = 0.5 / num1;
		if (GMM_coordinate_system == GMM_CS.left_handed) {
			return [(m12 - m21) * num2,
					(m20 - m02) * num2,
					(m01 - m10) * num2,
					num1 * 0.5];
		} else {
			return [(m12 - m21) * num2,
					-(m20 - m02) * num2,
					-num1 * 0.5,
					-(m01 - m10) * num2];
		}
				
	}
	if (m00 >= m11 && m00 >= m22) {
		num1 = sqrt(((1.0 + m00) - m11) - m22);
		num2 = 0.5 / num1;
		if (GMM_coordinate_system == GMM_CS.left_handed) {
			return [0.5 * num1,
					(m01 + m10) * num2,
					(m02 + m20) * num2,
					(m12 - m21) * num2];
		} else {
			return [0.5 * num1,
					-(m01 + m10) * num2,
					-(m12 - m21) * num2,
					-(m02 + m20) * num2];
		}
	}
	if (m11 > m22) {
		num1 = sqrt(((1.0 + m11) - m00) - m22);
		num2 = 0.5 / num1;
		if (GMM_coordinate_system == GMM_CS.left_handed) {
			return [(m10 + m01) * num2,
					0.5 * num1,
					(m21 + m12) * num2,
					(m20 - m02) * num2];
		} else {
			return [(m10 + m01) * num2,
					-0.5 * num1,
					-(m20 - m02) * num2,
					-(m21 + m12) * num2];
		}
	}
	num1 = sqrt(((1.0 + m22) - m00) - m11);
	num2 = 0.5 / num1;
	if (GMM_coordinate_system == GMM_CS.left_handed) {
	return [(m20 + m02) * num2,
			(m21 + m12) * num2,
			0.5 * num1,
			(m01 - m10) * num2];
	} else {
	return [(m20 + m02) * num2,
			-(m21 + m12) * num2,
			-(m01 - m10) * num2,
			-0.5 * num1];
	}

}
