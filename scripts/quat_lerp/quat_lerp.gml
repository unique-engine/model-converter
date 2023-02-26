// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the linear interpolation of two input quaternions by the given amount
 * @param	{Array<Real>} quat_1	(Quat) The first quaternion
 * @param	{Array<Real>} quat_2	(Quat) The second quaternion
 * @param	{Real} amount			The amount to interpolate
 * @returns	{Array<Real>}			(Quat)
 */
function quat_lerp(quat_1, quat_2, amount) {

	return [quat_1[Quat.x] + amount * (quat_2[Quat.x] - quat_1[Quat.x]),
			quat_1[Quat.y] + amount * (quat_2[Quat.y] - quat_1[Quat.y]),
			quat_1[Quat.z] + amount * (quat_2[Quat.z] - quat_1[Quat.z]),
			quat_1[Quat.w] + amount * (quat_2[Quat.w] - quat_1[Quat.w]) ];

}


/**
 * Returns the linear interpolation of two input quaternions by the given amount
 * @param	{Array<Real>} quat_1	(Quat) The first quaternion
 * @param	{Array<Real>} quat_2	(Quat) The second quaternion
 * @param	{Real} amount			The amount to interpolate
 * @returns	{Array<Real>}			(Quat)
 */
function quat_lerp_normalized(quat_1, quat_2, amount) {

	var qtw = quat_1[Quat.w] + amount * (quat_2[Quat.w] - quat_1[Quat.w]);
	var qtx = quat_1[Quat.x] + amount * (quat_2[Quat.x] - quat_1[Quat.x]);
	var qty = quat_1[Quat.y] + amount * (quat_2[Quat.y] - quat_1[Quat.y]);
	var qtz = quat_1[Quat.z] + amount * (quat_2[Quat.z] - quat_1[Quat.z]);

	var factor = sqrt(	qtx * qtx +
						qty * qty +
						qtz * qtz +
						qtw * qtw );

	if (factor != 0.0)
	{
	    return [qtx / factor,
			    qty / factor,
			    qtz / factor,
			    qtw / factor ];
	}
	
	return [qtx, qty, qtz, qtw ];

}
