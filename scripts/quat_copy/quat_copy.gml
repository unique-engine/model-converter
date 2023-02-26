// @author		Giacomo Marton
// @version		1.0.0


/**
 * Copy the data from one quaternion to another
 * @param	{Array<Real>} quat		(Quat) The quaternion on which to copy the components
 * @param	{Array<Real>} source		(Quat) The source quaternion from which to copy the components
 */
function quat_copy(quat, source) {

	quat[Quat.x] = source[Quat.x];
	quat[Quat.y] = source[Quat.y];
	quat[Quat.z] = source[Quat.z];
	quat[Quat.w] = source[Quat.w];

}
