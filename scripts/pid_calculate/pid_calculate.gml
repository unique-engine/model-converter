// @author		Giacomo Marton
// @version		1.0.0


/**
 * Calculates and returns the output of the PID
 * @param	{Real} pid		The PID to calculate
 * @param	{Real} dt		Delta time from the last calculation
 * @param	{Real} sp		Set Point
 * @param	{Real} pv		Process Value
 * @returns	{Real}
 */
function pid_calculate(pid, dt, sp, pv) {
	gml_pragma("forceinline");
	
    var err = sp - pv;

    var Pout = pid[PID.kp] * err;

    pid[PID.integral] += err * dt;
    var Iout = pid[PID.ki] * pid[PID.integral];

    var derivative = (err - pid[PID.pre_error]) / dt;
    var Dout = pid[PID.kd] * derivative;

    var output = Pout + Iout + Dout;

    if( output > pid[PID.out_max] )
        output = pid[PID.out_max];
    else if( output < pid[PID.out_min] )
        output = pid[PID.out_min];

    pid[PID.pre_error] = err;

    return output;
}
