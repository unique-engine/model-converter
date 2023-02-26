// @author		Giacomo Marton
// @version		1.0.0


/**
 * Decomposes an affine matrix into its transformation components
 * @param	{Array<Real>} matrix		(Mat4) The matrix to decompose
 * @returns	{Array<Array<Real>>}
 * 
 * The given matrix needs to be an affine matrix for this script to work properly
 * The returned value is an array with a specific transformation in each cell:
 * array[0] : Vec3 Translation
 * array[1] : Quat Rotation
 * array[2] : Vec3 Scale
 */
function mat4_decompose(matrix) {
	gml_pragma("forceinline");
	
	//Support variables for performance
	var m00 = matrix[Mat4.m00];
	var m01 = matrix[Mat4.m01];
	var m02 = matrix[Mat4.m02];
	var m10 = matrix[Mat4.m10];
	var m11 = matrix[Mat4.m11];
	var m12 = matrix[Mat4.m12];
	var m20 = matrix[Mat4.m20];
	var m21 = matrix[Mat4.m21];
	var m22 = matrix[Mat4.m22];

	//Scale
	var sx = sqrt(m00 * m00 + m01 * m01 + m02 * m02);
	var sy = sqrt(m10 * m10 + m11 * m11 + m12 * m12);
	var sz = sqrt(m20 * m20 + m21 * m21 + m22 * m22);
	var scale = [sx, sy, sz];

	//Rotation
	var rot_matrix = [ m00 / sx,
					m01 / sx,
					m02 / sx,
					m10 / sy,
					m11 / sy,
					m12 / sy,
					m20 / sz,
					m21 / sz,
					m22 / sz];

	var rot = mat3_to_quat(rot_matrix);

	//Position
	var pos = [ matrix[Mat4.m30],
				matrix[Mat4.m31],
				matrix[Mat4.m32]];

	return [pos, rot, scale];

}
