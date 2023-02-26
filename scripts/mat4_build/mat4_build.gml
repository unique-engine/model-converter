// @author		Giacomo Marton
// @version		1.0.0


/**
 * Builds a matrix with the given transformation settings
 * @param	{Array<Real>} position		(Vec3) The position vector
 * @param	{Array<Real>} rotation		(Quat) The rotation factor
 * @param	{Array<Real>} scaling		(Vec3) The scaling factor
 * @returns	{Array<Real>}				(Mat4)
 */
function mat4_build(position, rotation, scaling) {
	gml_pragma("forceinline");
	
	//Rotation
	var W = rotation[Quat.w];
	var X = rotation[Quat.x];
	var Y = rotation[Quat.y];
	var Z = rotation[Quat.z];
	//Scaling
	var sx = scaling[Vec3.x];
	var sy = scaling[Vec3.y];
	var sz = scaling[Vec3.z];

	//Matrix building
	return [sx * (1.0 - 2.0 * (Y*Y + Z*Z)),
			sx * (2.0 * (X*Y + W*Z)),
			sx * (2.0 * (X*Z - W*Y)),
			0.0,
			sy * (2.0 * (X*Y - W*Z)),
			sy * (1.0 - 2.0 * (X*X + Z*Z)),
			sy * (2.0  *(Y*Z + W*X)),
			0.0,
			sz * (2.0 * (X*Z + W*Y)),
			sz * (2.0 * (Y*Z - W*X)),
			sz * (1.0 - 2.0 * (X*X + Y*Y)),
			0.0,
			position[Vec3.x],
			position[Vec3.y],
			position[Vec3.z],
			1.0];

}


/**
 * Builds a matrix using a coordinate system
 * @param	{Array<Real>} forward			(Vec3) The forward vector
 * @param	{Array<Real>} right				(Vec3) The right vector
 * @param	{Array<Real>} up				(Vec3) The up vector
 * @param	{Array<Real>} translation		(Vec3) The origin translation
 * @returns	{Array<Real>}					(Mat4)
 */
function mat4_build_coord_system(forward, right, up, translation) {

	//Matrix building
	return [right[Vec3.x],
			right[Vec3.y],
			right[Vec3.z],
			0.0,
			up[Vec3.x],
			up[Vec3.y],
			up[Vec3.z],
			0.0,
			forward[Vec3.x],
			forward[Vec3.y],
			forward[Vec3.z],
			0.0,
			translation[Vec3.x],
			translation[Vec3.y],
			translation[Vec3.z],
			1.0];

}