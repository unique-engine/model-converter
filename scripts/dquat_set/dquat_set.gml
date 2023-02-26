// @author		Giacomo Marton
// @version		1.0.0


/**
 * Creates a dual quaternion
 * @param	{Real} rx		Component x for real part
 * @param	{Real} ry		Component y for real part
 * @param	{Real} rz		Component z for real part
 * @param	{Real} rw		Component w for real part
 * @param	{Real} dx		Component x for dual part
 * @param	{Real} dy		Component y for dual part
 * @param	{Real} dz		Component z for dual part
 * @param	{Real} dw		Component w for dual part
 * @returns	{Array<Real>}	(DualQuat)
 */
function dquat_set(rx, ry, rz, rw, dx, dy, dz, dw) {
	gml_pragma("forceinline");
	
	return [rx, ry, rz, rw,
			dx, dy, dz, dw];

}


/**
 * Creates a dual quaternion using two quaternions
 * @param	{Array<Real>} r		(Quat) Real part
 * @param	{Array<Real>} d		(Quat) Dual part
 * @returns	{Array<Real>}		(DualQuat)
 */
function dquat_set_quat(r, d) {
	gml_pragma("forceinline");
	
	return [r[Quat.x],
			r[Quat.y],
			r[Quat.z],
			r[Quat.w],
			d[Quat.x],
			d[Quat.y],
			d[Quat.z],
			d[Quat.w] ];

}
