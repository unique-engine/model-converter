// @author		Giacomo Marton
// @version		1.0.0


/**
 * Converts a matrix from Mat4 to Mat3
 * @param	{Array<Real>} matrix	(Mat4) The matrix to convert
 * @returns	{Array<Real>}			(Mat3)
 */
function mat4_to_mat3(matrix) {
	gml_pragma("forceinline");
	
	return [matrix[Mat4.m00], matrix[Mat4.m01], matrix[Mat4.m02],
			matrix[Mat4.m10], matrix[Mat4.m11], matrix[Mat4.m12],
			matrix[Mat4.m20], matrix[Mat4.m21], matrix[Mat4.m22]];

}


/**
 * Converts a 4x4 matrix to a dual quaternion.
 * @param	{Array<Real>} matrix	(Mat4) The matrix to convert
 * @returns	{Array<Real>}			(DualQUat)
 */
function mat4_to_dquat(matrix) {
	gml_pragma("forceinline");
	
	var m0x = matrix[Mat3x4.m00];
	var m0w = matrix[Mat3x4.m03];

	var m1y = matrix[Mat3x4.m11];
	var m1w = matrix[Mat3x4.m13];

	var m2z = matrix[Mat3x4.m22];
	var m2w = matrix[Mat3x4.m23];

	var dqrx;
	var dqry;
	var dqrz;
	var dqrw;

	var invr;

	var trace = m0x + m1y + m2z;
	if(trace > 0.0)
	{
		dqrw = 0.5 * sqrt(1.0 + trace);
		invr = 0.25 / dqrw;
		dqrx = (matrix[Mat3x4.m21] - matrix[Mat3x4.m12]) * invr;
		dqry = (matrix[Mat3x4.m02] - matrix[Mat3x4.m20]) * invr;
		dqrz = (matrix[Mat3x4.m10] - matrix[Mat3x4.m01]) * invr;
	}
	else if(m0x > m1y && m0x > m2z)
	{
		dqrx = 0.5 * sqrt(1.0 + m0x - m1y - m2z);
		invr = 0.25 / dqrx;
		dqry = (matrix[Mat3x4.m10] + matrix[Mat3x4.m01]) * invr;
		dqrz = (matrix[Mat3x4.m02] + matrix[Mat3x4.m20]) * invr;
		dqrw = (matrix[Mat3x4.m21] - matrix[Mat3x4.m12]) * invr;
	}
	else if(m1y > m2z)
	{
		dqry = 0.5 * sqrt(1.0 + m1y - m0x - m2z);
		invr = 0.25 / dqry;
		dqrx = (matrix[Mat3x4.m10] + matrix[Mat3x4.m01]) * invr;
		dqrz = (matrix[Mat3x4.m21] + matrix[Mat3x4.m12]) * invr;
		dqrw = (matrix[Mat3x4.m02] - matrix[Mat3x4.m20]) * invr;
	}
	else
	{
		dqrz = 0.5 * sqrt(1.0 + m2z - m0x - m1y);
		invr = 0.25 / dqrz;
		dqrx = (matrix[Mat3x4.m02] + matrix[Mat3x4.m20]) * invr;
		dqry = (matrix[Mat3x4.m21] + matrix[Mat3x4.m12]) * invr;
		dqrw = (matrix[Mat3x4.m10] - matrix[Mat3x4.m01]) * invr;
	}
	
	return [dqrx, dqry, dqrz, dqrw,
			0.5 * ( m0w * dqrw + m1w * dqrz - m2w * dqry),
			0.5 * (-m0w * dqrz + m1w * dqrw + m2w * dqrx),
			0.5 * ( m0w * dqry - m1w * dqrx + m2w * dqrw),
			-0.5 * ( m0w * dqrx + m1w * dqry + m2w * dqrz)];

}


/**
 * Converts a matrix into a quaternion
 * @param	{Array<Real>} matrix	(Mat4) The matrix to convert
 * @returns	{Array<Real>}			(Quat)
 */
function mat4_to_quat(matrix) {
	gml_pragma("forceinline");
	
	var m00 = matrix[Mat4.m00];
	var m01 = matrix[Mat4.m01];
	var m02 = matrix[Mat4.m02];
	var m10 = matrix[Mat4.m10];
	var m11 = matrix[Mat4.m11];
	var m12 = matrix[Mat4.m12];
	var m20 = matrix[Mat4.m20];
	var m21 = matrix[Mat4.m21];
	var m22 = matrix[Mat4.m22];

	var fourXSquaredMinus1 = m00 - m11 - m22;
	var fourYSquaredMinus1 = m11 - m00 - m22;
	var fourZSquaredMinus1 = m22 - m00 - m11;
	var fourWSquaredMinus1 = m00 + m11 + m22;

	var biggestIndex = 0;
	var fourBiggestSquaredMinus1 = fourWSquaredMinus1;
	if(fourBiggestSquaredMinus1 < fourXSquaredMinus1) {
		fourBiggestSquaredMinus1 = fourXSquaredMinus1;
		biggestIndex = 1;
	}
	if(fourBiggestSquaredMinus1 < fourYSquaredMinus1) {
		fourBiggestSquaredMinus1 = fourYSquaredMinus1;
		biggestIndex = 2;
	}
	if(fourBiggestSquaredMinus1 < fourZSquaredMinus1) {
		fourBiggestSquaredMinus1 = fourZSquaredMinus1;
		biggestIndex = 3;
	}

	var biggestVal = sqrt(fourBiggestSquaredMinus1 + 1.0) * 0.5;
	var mult = 0.25 / biggestVal;
	
	if (biggestIndex < 2) {
		if (biggestIndex == 0) 	{
			return [(m12 - m21) * mult,
					(m20 - m02) * mult,
					(m01 - m10) * mult,
					biggestVal];
		} else {	//biggestIndex == 1
			return [biggestVal,
					(m01 + m10) * mult,
					(m20 + m02) * mult,
					(m12 - m21) * mult];
		}
	} else {
		if (biggestIndex == 2) {
			return [(m01 + m10) * mult,
					biggestVal,
					(m12 + m21) * mult,
					(m20 - m02) * mult];
		} else {	//biggestIndex == 3
			return [(m20 + m02) * mult,
					(m12 + m21) * mult,
					biggestVal,
					(m01 - m10) * mult];
		}
	}

}


/**
 * Converts a 3x4 matrix to a dual quaternion.
 * @param	{Array<Real>} matrix	(Mat3x4) The matrix to convert
 * @returns	{Array<Real>}			(DualQUat)
 */
function mat3x4_to_dquat(matrix) {
	gml_pragma("forceinline");
	
	var m0x = matrix[Mat4.m00];
	var m0y = matrix[Mat4.m01];
	var m0z = matrix[Mat4.m02];
	var m0w = matrix[Mat4.m03];

	var m1x = matrix[Mat4.m10];
	var m1y = matrix[Mat4.m11];
	var m1z = matrix[Mat4.m12];
	var m1w = matrix[Mat4.m13];

	var m2x = matrix[Mat4.m20];
	var m2y = matrix[Mat4.m21];
	var m2z = matrix[Mat4.m22];
	var m2w = matrix[Mat4.m23];

	var dqrx;
	var dqry;
	var dqrz;
	var dqrw;

	var r;
	var invr;

	var trace = m0x + m1y + m2z;
	if(trace > 0.0)
	{
		r = sqrt(1.0 + trace);
		invr = 0.5 / r;
		dqrw = 0.5 * r;
		dqrx = (m2y - m1z) * invr;
		dqry = (m0z - m2x) * invr;
		dqrz = (m1x - m0y) * invr;
	}
	else if(m0x > m1y && m0x > m2z)
	{
		r = sqrt(1.0 + m0x - m1y - m2z);
		invr = 0.5 / r;
		dqrx = 0.5*r;
		dqry = (m1x + m0y) * invr;
		dqrz = (m0z + m2x) * invr;
		dqrw = (m2y - m1z) * invr;
	}
	else if(m1y > m2z)
	{
		r = sqrt(1.0 + m1y - m0x - m2z);
		invr = 0.5 / r;
		dqrx = (m1x + m0y) * invr;
		dqry = 0.5 * r;
		dqrz = (m2y + m1z) * invr;
		dqrw = (m0z - m2x) * invr;
	}
	else
	{
		r = sqrt(1.0 + m2z - m0x - m1y);
		invr = 0.5 / r;
		dqrx = (m0z + m2x) * invr;
		dqry = (m2y + m1z) * invr;
		dqrz = 0.5 * r;
		dqrw = (m1x - m0y) * invr;
	}
	
	return [dqrx, dqry, dqrz, dqrw,
			0.5 * ( m0w * dqrw + m1w * dqrz - m2w * dqry),
			0.5 * (-m0w * dqrz + m1w * dqrw + m2w * dqrx),
			0.5 * ( m0w * dqry - m1w * dqrx + m2w * dqrw),
			-0.5 * ( m0w * dqrx + m1w * dqry + m2w * dqrz)];

}


/**
 * Converts a matrix from Mat3 to Mat4
 * @param	{Array<Real>} matrix	(Mat3) The matrix to convert
 * @returns	{Array<Real>}			(Mat4)
 */
function mat3_to_mat4(matrix) {
	gml_pragma("forceinline");
	
	return [matrix[Mat3.m00], matrix[Mat3.m01], matrix[Mat3.m02], 0.0,
			matrix[Mat3.m10], matrix[Mat3.m11], matrix[Mat3.m12], 0.0,
			matrix[Mat3.m20], matrix[Mat3.m21], matrix[Mat3.m22], 0.0,
			0.0,			0.0,			0.0,			1.0];

}


/**
 * Converts a matrix into a quaternion
 * @param	{Array<Real>} matrix	(Mat3) The matrix to convert
 * @returns	{Array<Real>}			(Quat)
 */
function mat3_to_quat(matrix) {
	gml_pragma("forceinline");
	
	var m00 = matrix[Mat3.m00];
	var m01 = matrix[Mat3.m01];
	var m02 = matrix[Mat3.m02];
	var m10 = matrix[Mat3.m10];
	var m11 = matrix[Mat3.m11];
	var m12 = matrix[Mat3.m12];
	var m20 = matrix[Mat3.m20];
	var m21 = matrix[Mat3.m21];
	var m22 = matrix[Mat3.m22];
	
	var fourXSquaredMinus1 = m00 - m11 - m22;
	var fourYSquaredMinus1 = m11 - m00 - m22;
	var fourZSquaredMinus1 = m22 - m00 - m11;
	var fourWSquaredMinus1 = m00 + m11 + m22;

	var biggestIndex = 0;
	var fourBiggestSquaredMinus1 = fourWSquaredMinus1;
	if(fourBiggestSquaredMinus1 < fourXSquaredMinus1)
	{
		fourBiggestSquaredMinus1 = fourXSquaredMinus1;
		biggestIndex = 1;
	}
	if(fourBiggestSquaredMinus1 < fourYSquaredMinus1)
	{
		fourBiggestSquaredMinus1 = fourYSquaredMinus1;
		biggestIndex = 2;
	}
	if(fourBiggestSquaredMinus1 < fourZSquaredMinus1)
	{
		fourBiggestSquaredMinus1 = fourZSquaredMinus1;
		biggestIndex = 3;
	}

	var biggestVal = sqrt(fourBiggestSquaredMinus1 + 1.0) * 0.5;
	var mult = 0.25 / biggestVal;
	
	if (biggestIndex < 2)
	{
		if (biggestIndex == 0)
		{
			return [(m12 - m21) * mult,
					(m20 - m02) * mult,
					(m01 - m10) * mult,
					biggestVal];
		}
		else	//biggestIndex == 1
		{
			return [biggestVal,
					(m01 + m10) * mult,
					(m20 + m02) * mult,
					(m12 - m21) * mult];
		}
	}
	else
	{
		if (biggestIndex == 2)
		{
			return [(m01 + m10) * mult,
					biggestVal,
					(m12 + m21) * mult,
					(m20 - m02) * mult];
		}
		else	//biggestIndex == 3
		{
			return [(m20 + m02) * mult,
					(m12 + m21) * mult,
					biggestVal,
					(m01 - m10) * mult];
		}
	}

}
