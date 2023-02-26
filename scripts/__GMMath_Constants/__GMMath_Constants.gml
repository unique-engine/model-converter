// @author		Giacomo Marton
// @version		1.0.0


///Constants definition for GMMath

#region Constant numbers

	#macro ConstNum_zero 0.0
	#macro ConstNum_one 1.0
	#macro ConstNum_two_pi 6.28318530717958647692528676655900576
	#macro ConstNum_root_pi 1.772453850905516027
	#macro ConstNum_half_pi 1.57079632679489661923132169163975144
	#macro ConstNum_three_over_two_pi 4.71238898038468985769396507491925432
	#macro ConstNum_quarter_pi 0.785398163397448309615660845819875721
	#macro ConstNum_one_over_pi 0.318309886183790671537767526745028724
	#macro ConstNum_one_over_two_pi 0.159154943091895335768883763372514362
	#macro ConstNum_two_over_pi 0.636619772367581343075535053490057448
	#macro ConstNum_four_over_pi 1.273239544735162686151070106980114898
	#macro ConstNum_two_over_root_pi 1.12837916709551257389615890312154517
	#macro ConstNum_one_over_root_two 0.707106781186547524400844362104849039
	#macro ConstNum_root_half_pi 1.253314137315500251
	#macro ConstNum_root_two_pi 2.506628274631000502
	#macro ConstNum_root_ln_four 1.17741002251547469
	#macro ConstNum_e 2.71828182845904523536
	#macro ConstNum_euler 0.577215664901532860606
	#macro ConstNum_root_two 1.41421356237309504880168872420969808
	#macro ConstNum_root_three 1.73205080756887729352744634150587236
	#macro ConstNum_root_five 2.23606797749978969640917366873127623
	#macro ConstNum_ln_two 0.693147180559945309417232121458176568
	#macro ConstNum_ln_ten 2.30258509299404568401799145468436421
	#macro ConstNum_ln_ln_two -0.3665129205816643
	#macro ConstNum_third 0.3333333333333333333333333333333333333333
	#macro ConstNum_two_thirds 0.666666666666666666666666666666666666667
	#macro ConstNum_degtorad 0.01745329251
	#macro ConstNum_half_degtorad 0.00872664625
	#macro ConstNum_two_degtorad 0.03490658503
	#macro ConstNum_golden_ratio 1.61803398874989484820458683436563811

#endregion



#region Constants for Mat4

	//Returns a "no rotation" quaternion
	#macro mat4_identity [1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0]
	
	//Shorthand for writing all components to zero
	#macro mat4_zero [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

#endregion


#region Constants for Quat

	//Returns a "no rotation" quaternion
	#macro quat_identity [0.0, 0.0, 0.0, 1.0]

#endregion


#region Constants for vec2

	//Shorthand for writing vec2_set(0, 0)
	#macro vec2_zero [0.0, 0.0]

	//Shorthand for writing vec2_set(1, 1)
	#macro vec2_one [1.0, 1.0]

	//Shorthand for writing vec2_set(infinity, infinity)
	#macro vec2_infinity [infinity, infinity]

	//Shorthand for writing vec2_set(-infinity, -infinity)
	#macro vec2_negative_infinity [-infinity, -infinity]

	//Shorthand for writing vec2_set(0, -1)
	#macro vec2_forward [0.0, -1.0]

	//Shorthand for writing vec2_set(0, 1)
	#macro vec2_back [0.0, 1.0]

	//Shorthand for writing vec2_set(1, 0)
	#macro vec2_right [1.0, 0.0]

	//Shorthand for writing vec2_set(-1, 0)
	#macro vec2_left [-1.0, 0.0]

#endregion


#region Constants for vec3

	//Shorthand for writing vec3_set(0, 0, 0)
	#macro vec3_zero [0.0, 0.0, 0.0]

	//Shorthand for writing vec3_set(1, 1, 1)
	#macro vec3_one [1.0, 1.0, 1.0]

	//Shorthand for writing vec3_set(infinity, infinity, infinity)
	#macro vec3_infinity [infinity, infinity, infinity]

	//Shorthand for writing vec3_set(-infinity, -infinity, -infinity)
	#macro vec3_negative_infinity [-infinity, -infinity, -infinity]

	//Shorthand for writing vec3_set(0, -1, 0)
	#macro vec3_forward [0.0, -1.0, 0.0]

	//Shorthand for writing vec3_set(0, 1, 0)
	#macro vec3_back [0.0, 1.0, 0.0]

	//Shorthand for writing vec3_set(1, 0, 0)
	#macro vec3_right [1.0, 0.0, 0.0]

	//Shorthand for writing vec3_set(-1, 0, 0)
	#macro vec3_left [-1.0, 0.0, 0.0]

	//Shorthand for writing vec3_set(0, 0, 1)
	#macro vec3_up [0.0, 0.0, 1.0]

	//Shorthand for writing vec3_set(0, 0, -1)
	#macro vec3_down [0.0, 0.0, -1.0]

#endregion


#region Constants for vec4

	//Shorthand for writing vec4_set(0, 0, 0, 0)
	#macro vec4_zero [0.0, 0.0, 0.0, 0.0]

	//Shorthand for writing vec4_set(1, 1, 1, 1)
	#macro vec4_one [1.0, 1.0, 1.0, 1.0]

	//Shorthand for writing vec4_set(infinity, infinity, infinity, infinity)
	#macro vec4_infinity [infinity, infinity, infinity, infinity]

	//Shorthand for writing vec4_set(-infinity, -infinity, -infinity, -infinity)
	#macro vec4_negative_infinity [-infinity, -infinity, -infinity, -infinity]
	
	//Shorthand for writing vec4_set(0, -1, 0, 0)
	#macro vec4_forward [0.0, -1.0, 0.0, 0.0]

	//Shorthand for writing vec4_set(0, 1, 0, 0)
	#macro vec4_back [0.0, 1.0, 0.0, 0.0]

	//Shorthand for writing vec4_set(1, 0, 0, 0)
	#macro vec4_right [1.0, 0.0, 0.0, 0.0]

	//Shorthand for writing vec4_set(-1, 0, 0, 0)
	#macro vec4_left [-1.0, 0.0, 0.0, 0.0]

	//Shorthand for writing vec4_set(0, 0, 1, 0)
	#macro vec4_up [0.0, 0.0, 1.0, 0.0]

	//Shorthand for writing vec4_set(0, 0, -1, 0)
	#macro vec4_down [0.0, 0.0, -1.0, 0.0]

	//Shorthand for writing vec4_set(0, 0, 0, 1)
	#macro vec4_w1 [0.0, 0.0, 0.0, 1.0]

#endregion


//Initializes global values for faster access but unsafe (they can be changed globally forever)
gml_pragma("global", "init_GMM_globals()");
/// @ignore
function init_GMM_globals()
{
	/// @ignore
	global.GMM_mat4_identity = mat4_identity;
	/// @ignore
	global.GMM_mat4_zero = mat4_zero;
	/// @ignore
	global.GMM_quat_identity = quat_identity;
	/// @ignore
	global.GMM_vec2_zero = vec2_zero;
	/// @ignore
	global.GMM_vec2_one = vec2_one;
	/// @ignore
	global.GMM_vec2_infinity = vec2_infinity;
	/// @ignore
	global.GMM_vec2_negative_infinity = vec2_negative_infinity;
	/// @ignore
	global.GMM_vec2_forward = vec2_forward;
	/// @ignore
	global.GMM_vec2_back = vec2_back;
	/// @ignore
	global.GMM_vec2_right = vec2_right;
	/// @ignore
	global.GMM_vec2_left = vec2_left;
	/// @ignore
	global.GMM_vec3_zero = vec3_zero;
	/// @ignore
	global.GMM_vec3_one = vec3_one;
	/// @ignore
	global.GMM_vec3_infinity = vec3_infinity;
	/// @ignore
	global.GMM_vec3_negative_infinity = vec3_negative_infinity;
	/// @ignore
	global.GMM_vec3_forward = vec3_forward;
	/// @ignore
	global.GMM_vec3_back = vec3_back;
	/// @ignore
	global.GMM_vec3_right = vec3_right;
	/// @ignore
	global.GMM_vec3_left = vec3_left;
	/// @ignore
	global.GMM_vec3_up = vec3_up;
	/// @ignore
	global.GMM_vec3_down = vec3_down;
	/// @ignore
	global.GMM_vec4_zero = vec4_zero;
	/// @ignore
	global.GMM_vec4_one = vec4_one;
	/// @ignore
	global.GMM_vec4_infinity = vec4_infinity;
	/// @ignore
	global.GMM_vec4_negative_infinity = vec4_negative_infinity;
	/// @ignore
	global.GMM_vec4_forward = vec4_forward;
	/// @ignore
	global.GMM_vec4_back = vec4_back;
	/// @ignore
	global.GMM_vec4_right = vec4_right;
	/// @ignore
	global.GMM_vec4_left = vec4_left;
	/// @ignore
	global.GMM_vec4_up = vec4_up;
	/// @ignore
	global.GMM_vec4_down = vec4_down;
	/// @ignore
	global.GMM_vec4_w1 = vec4_w1;
}