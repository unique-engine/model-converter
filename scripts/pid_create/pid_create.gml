// @author		Giacomo Marton
// @version		1.0.0


/**
 * Creates a PID
 * @param	{Real} out_max		Maximum output value
 * @param	{Real} out_min		Minimum output value
 * @param	{Real} kp			Proportional
 * @param	{Real} ki			Integral
 * @param	{Real} kd			Derivative
 * @returns	{Array<Real>}		(PID)
  */
function pid_create(out_max, out_min, kp, ki, kd) {
	gml_pragma("forceinline");
	
	var pid;
	
	pid[PID.out_max] = out_max;
	pid[PID.out_min] = out_min;
	pid[PID.kp] = kp;
	pid[PID.ki] = ki;
	pid[PID.kd] = kd;
	pid[PID.pre_error] = 0.0;
	pid[PID.integral] = 0.0;
	
	return pid;
}
