// @author		Giacomo Marton
// @version		1.0.0


///General settings and enums for the GMMath library

//Macros
#macro GMM_epsilon 0.00001
#macro GMM_optimization GMM_Optim.yyc

#macro GMM_coordinate_system GMM_CS.left_handed
#macro GMM_depth_clip_space GMM_DCS.zero_to_one


	
//Not a setting, just derived from them
#macro GMM_one_minus_epsilon 1.0 - GMM_epsilon

//Enums
enum GMM_CS
{
	left_handed,
	right_handed
}

enum GMM_DCS
{
	zero_to_one,
	minus_one_to_one
}

enum GMM_Optim
{
	vm,		//virtual machine
	yyc,	//yoyo compiler
	html5,	//html5
	ogx		//opera gx
}
