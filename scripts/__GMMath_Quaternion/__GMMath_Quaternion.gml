// @author		Giacomo Marton
// @version		1.0.0


///Enumerations definition for GMMath

//Quaternion
enum Quat
{
	x,
	y,
	z,
	w
}

//Dual Quaternion
enum DQuat
{
	//real part
	rx,
	ry,
	rz,
	rw,
	
	//dual part
	dx,
	dy,
	dz,
	dw
}
