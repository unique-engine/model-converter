// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the inverse of the given matrix
 * @param	{Array<Real>} matrix	(Mat4) The matrix to invert
 * @returns	{Array<Real>}			(Mat4)
 */
function mat4_inverse(matrix) {
	gml_pragma("forceinline");
	
	var m00 = matrix[Mat4.m00],
		m01 = matrix[Mat4.m01],
		m02 = matrix[Mat4.m02],
		m03 = matrix[Mat4.m03],
		m10 = matrix[Mat4.m10],
		m11 = matrix[Mat4.m11],
		m12 = matrix[Mat4.m12],
		m13 = matrix[Mat4.m13],
		m20 = matrix[Mat4.m20],
		m21 = matrix[Mat4.m21],
		m22 = matrix[Mat4.m22],
		m23 = matrix[Mat4.m23],
		m30 = matrix[Mat4.m30],
		m31 = matrix[Mat4.m31],
		m32 = matrix[Mat4.m32],
		m33 = matrix[Mat4.m33];
	var a	= m11 * m22 - m21 * m12,
		d	= m20 * m12 - m10 * m22,
		g	= m10 * m21 - m20 * m11,
		j	= m12 * m23 - m13 * m22,
		m	= m21 * m13 - m11 * m23,
		p	= m10 * m23 - m20 * m13,
		i0	= m31 * j + m32 * m + m33 * a,
		i4	= -m30 * j + m32 * p + m33 * d,
		i8	= -m30 * m - m31 * p + m33 * g,
		i12	= -m30 * a - m31 * d - m32 * g;
	
	var det = m00 * i0 + m01 * i4 + m02 * i8 + m03 * i12;
	
	if (det == 0.0) {
		return matrix;
	}
	
	var b = m21 * m02 - m01 * m22,
		c = m01 * m12 - m11 * m02,
		e = m00 * m22 - m20 * m02,
		f = m10 * m02 - m00 * m12,
		h = m20 * m01 - m00 * m21,
		i = m00 * m11 - m10 * m01,
		k = m03 * m22 - m02 * m23,
		l = m02 * m13 - m03 * m12,
		n = m01 * m23 - m21 * m03,
		o = m11 * m03 - m01 * m13,
		q = m20 * m03 - m00 * m23,
		r = m00 * m13 - m10 * m03;
	
	det = 1.0 / det;	//multiplication is faster than division
	
	return [det * i0,
			det * (m31 * k + m32 * n + m33 * b),
			det * (m31 * l + m32 * o + m33 * c),
			det * (-m03 * a - m13 * b - m23 * c),
			det * i4,
			det * (-m30 * k + m32 * q + m33 * e),
			det * (-m30 * l + m32 * r + m33 * f),
			det * (-m03 * d - m13 * e - m23 * f),
			det * i8,
			det * (-m30 * n - m31 * q + m33 * h),
			det * (-m30 * o - m31 * r + m33 * i),
			det * (-m03 * g - m13 * h - m23 * i),
			det * i12,
			det * (-m30 * b - m31 * e - m32 * h),
			det * (-m30 * c - m31 * f - m32 * i),
			det * (m00 * a + m10 * b + m20 * c)];
}


/**
 * Returns the inverse of the given affine matrix.
 * This function is faster than mat4_inverse() but works only with affine matrices
 * @param	{Array<Real>} matrix		(Mat4) The matrix to invert
 * @returns	{Array<Real>}				(Mat4)
 */
function mat4_inverse_affine(matrix) {
	gml_pragma("forceinline");
	
	var m00 = matrix[Mat4.m00],
		m01 = matrix[Mat4.m01],
		m02 = matrix[Mat4.m02],
		m10 = matrix[Mat4.m10],
		m11 = matrix[Mat4.m11],
		m12 = matrix[Mat4.m12],
		m20 = matrix[Mat4.m20],
		m21 = matrix[Mat4.m21],
		m22 = matrix[Mat4.m22],
		m30 = matrix[Mat4.m30],
		m31 = matrix[Mat4.m31],
		m32 = matrix[Mat4.m32];
		
	var i0 = m11 * m22 - m21 * m12,
		i4 = m20 * m12 - m10 * m22,
		i8 = m10 * m21 - m20 * m11;
		
	var det = m00 * i0 + m01 * i4 + m02 * i8;
	
	if (det == 0.0) {
		return matrix;
	}
	
	det = 1.0 / det;	//multiplication is faster than division
	
	var c0 = det * i0,
		c1 = det * (m21 * m02 - m01 * m22),
		c2 = det * (m01 * m12 - m11 * m02),
		c4 = det * i4,
		c5 = det * (m00 * m22 - m20 * m02),
		c6 = det * (m10 * m02 - m00 * m12),
		c8 = det * i8,
		c9 = det * (m20 * m01 - m00 * m21),
		c10 = det * (m00 * m11 - m10 * m01);
	
	return [c0,
			c1,
			c2,
			0,
			c4,
			c5,
			c6,
			0,
			c8,
			c9,
			c10,
			0,
			-(m30 * c0 + m31 * c4 + m32 * c8),
			-(m30 * c1 + m31 * c5 + m32 * c9),
			-(m30 * c2 + m31 * c6 + m32 * c10),
			(m20 * c2 + m21 * c6 + m22 * c10)];
}


/**
 * Returns the inverse of the given matrix and transpose it
 * @param	{Array<Real>} matrix		(Mat4) The matrix to invert and transpose
 * @returns	{Array<Real>}				(Mat4)
 */
function mat4_inverse_transpose(matrix) {
	gml_pragma("forceinline");
	
	var m00 = matrix[Mat4.m00],
		m01 = matrix[Mat4.m01],
		m02 = matrix[Mat4.m02],
		m03 = matrix[Mat4.m03],
		m10 = matrix[Mat4.m10],
		m11 = matrix[Mat4.m11],
		m12 = matrix[Mat4.m12],
		m13 = matrix[Mat4.m13],
		m20 = matrix[Mat4.m20],
		m21 = matrix[Mat4.m21],
		m22 = matrix[Mat4.m22],
		m23 = matrix[Mat4.m23],
		m30 = matrix[Mat4.m30],
		m31 = matrix[Mat4.m31],
		m32 = matrix[Mat4.m32],
		m33 = matrix[Mat4.m33];
	var a	= m11 * m22 - m21 * m12,
		d	= m20 * m12 - m10 * m22,
		g	= m10 * m21 - m20 * m11,
		j	= m12 * m23 - m13 * m22,
		m	= m21 * m13 - m11 * m23,
		p	= m10 * m23 - m20 * m13,
		i0	= m31 * j + m32 * m + m33 * a,
		i4	= -m30 * j + m32 * p + m33 * d,
		i8	= -m30 * m - m31 * p + m33 * g,
		i12	= -m30 * a - m31 * d - m32 * g;
	
	var det = m00 * i0 + m01 * i4 + m02 * i8 + m03 * i12;
	
	if (det == 0.0) {
		return matrix;
	}
	
	var b = m21 * m02 - m01 * m22,
		c = m01 * m12 - m11 * m02,
		e = m00 * m22 - m20 * m02,
		f = m10 * m02 - m00 * m12,
		h = m20 * m01 - m00 * m21,
		i = m00 * m11 - m10 * m01,
		k = m03 * m22 - m02 * m23,
		l = m02 * m13 - m03 * m12,
		n = m01 * m23 - m21 * m03,
		o = m11 * m03 - m01 * m13,
		q = m20 * m03 - m00 * m23,
		r = m00 * m13 - m10 * m03;
	
	det = 1.0 / det;	//multiplication is faster than division
	
	return [det * i0,
			det * i4,
			det * i8,
			det * i12,
			det * (m31 * k + m32 * n + m33 * b),
			det * (-m30 * k + m32 * q + m33 * e),
			det * (-m30 * n - m31 * q + m33 * h),
			det * (-m30 * b - m31 * e - m32 * h),
			det * (m31 * l + m32 * o + m33 * c),
			det * (-m30 * l + m32 * r + m33 * f),
			det * (-m30 * o - m31 * r + m33 * i),
			det * (-m30 * c - m31 * f - m32 * i),
			det * (-m03 * a - m13 * b - m23 * c),
			det * (-m03 * d - m13 * e - m23 * f),
			det * (-m03 * g - m13 * h - m23 * i),
			det * (m00 * a + m10 * b + m20 * c)];
}


/**
 * Returns the inverse of the given affine matrix and transpose it.
 * This function is faster than mat4_inverse_transpose() but works only with affine matrices
 * @param	{Array<Real>} matrix		(Mat4)	The matrix to invert and transpose
 * @returns	{Array<Real>}				(Mat4)
 */
function mat4_inverse_affine_transpose(matrix) {
	gml_pragma("forceinline");
	
	var m00 = matrix[Mat4.m00],
		m01 = matrix[Mat4.m01],
		m02 = matrix[Mat4.m02],
		m10 = matrix[Mat4.m10],
		m11 = matrix[Mat4.m11],
		m12 = matrix[Mat4.m12],
		m20 = matrix[Mat4.m20],
		m21 = matrix[Mat4.m21],
		m22 = matrix[Mat4.m22],
		m30 = matrix[Mat4.m30],
		m31 = matrix[Mat4.m31],
		m32 = matrix[Mat4.m32];
		
	var i0 = m11 * m22 - m21 * m12,
		i4 = m20 * m12 - m10 * m22,
		i8 = m10 * m21 - m20 * m11;
		
	var det = m00 * i0 + m01 * i4 + m02 * i8;
	
	if (det == 0.0) {
		return matrix;
	}
	
	det = 1.0 / det;	//multiplication is faster than division
	
	var c0 = det * i0,
		c1 = det * (m21 * m02 - m01 * m22),
		c2 = det * (m01 * m12 - m11 * m02),
		c4 = det * i4,
		c5 = det * (m00 * m22 - m20 * m02),
		c6 = det * (m10 * m02 - m00 * m12),
		c8 = det * i8,
		c9 = det * (m20 * m01 - m00 * m21),
		c10 = det * (m00 * m11 - m10 * m01);
	
	return [c0,
			c4,
			c8,
			-(m30 * c0 + m31 * c4 + m32 * c8),
			c1,
			c5,
			c9,
			-(m30 * c1 + m31 * c5 + m32 * c9),
			c2,
			c6,
			c10,
			-(m30 * c2 + m31 * c6 + m32 * c10),
			0,
			0,
			0,
			(m20 * c2 + m21 * c6 + m22 * c10)];
}
