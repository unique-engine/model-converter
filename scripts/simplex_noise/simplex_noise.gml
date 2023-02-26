// @author		Giacomo Marton
// @version		1.0.0


/**
 * Returns the a random value using simplex noise distribution
 * 
 * The return value is always in the range [0.0,1.0].
 * It is repeatable, in that a particular input value will always produce the same return value
 * @param	{Real} val_x		Value to be used to seed the noise function
 * @returns	{Real}
 */
function simplex_noise_1D(val_x) {
	gml_pragma("forceinline");
	
	var i0 = floor(val_x);
	var i1 = i0 + 1;
	var x0 = val_x - i0;
	var x1 = x0 - 1;

	var t0 = 1 - x0*x0;
	t0 *= t0;

	var h1 = global.GMMath_int_PERMUTATION[i0 & 255] & 15;
	var grad1 = 1 + (h1 & 7);
	if ((h1 & 8) != 0) {grad1 = -grad1;}

	var t1 = 1 - x1*x1;
	t1 *= t1;

	var h2 = global.GMMath_int_PERMUTATION[i1 & 255] & 15;
	var grad2 = 1 + (h2 & 7);
	if ((h2 & 8) != 0) {grad2 = -grad2;}


	return 0.395 * ((t0 * t0 * grad1 * x0) + (t1 * t1 * grad2 * x1));

}


/**
 * Returns the a random value using simplex noise distribution
 * 
 * The return value is always in the range [0.0,1.0].
 * It is repeatable, in that a particular input value will always produce the same return value
 * @param	{Real} val_x		Value to be used to seed the noise function
 * @param	{Real} val_y		Value to be used to seed the noise function
 * @returns	{Real}
 */
function simplex_noise_2D(val_x, val_y) {
	gml_pragma("forceinline");
	
	var n0, n1, n2;

	var s = (val_x + val_y) * 0.366025403;
	var i = floor(val_x + s);
	var j = floor(val_y + s);

	var t = (i + j) * 0.211324865;
	var x0 = val_x - (i - t);
	var y0 = val_y - (j - t);


	var i1, j1;
	if (x0 > y0) {i1 = 1; j1 = 0;}
	else {i1 = 0; j1 = 1;}


	var x1 = x0 - i1 + 0.211324865;
	var y1 = y0 - j1 + 0.211324865;
	var x2 = x0 - 0.57735027;
	var y2 = y0 - 0.57735027;


	var ii = i mod 256;
	var jj = j mod 256;


	var t0 = 0.5 - x0*x0 - y0*y0;
	if (t0 < 0) n0 = 0;
	else
	{
	    t0 *= t0;
    
	    var h = global.GMMath_int_PERMUTATION[ii + global.GMMath_int_PERMUTATION[jj]] & 7;
	    var u, v;
	    if (h < 4) {u = x0; v = y0;}
	    else {u = y0; v = x0;}
    
	    var final_val;
	    if ((h & 1) != 0) {final_val = -u;}
	    else {final_val = u;}
	    if ((h & 2) != 0) {final_val += -2*v;}
	    else {final_val += 2*v;}
    
	    n0 = t0 * t0 * final_val; 
	}

	var t1 = 0.5 - x1*x1 - y1*y1;
	if (t1 < 0) n1 = 0;
	else
	{
	    t1 *= t1;
    
	    var h = global.GMMath_int_PERMUTATION[ii + i1 + global.GMMath_int_PERMUTATION[jj + j1]] & 7;
	    var u, v;
	    if (h < 4) {u = x1; v = y1;}
	    else {u = y1; v = x1;}
    
	    var final_val;
	    if ((h & 1) != 0) {final_val = -u;}
	    else {final_val = u;}
	    if ((h & 2) != 0) {final_val += -2*v;}
	    else {final_val += 2*v;}
    
	    n1 = t1 * t1 * final_val;
	}

	var t2 = 0.5 - x2*x2 - y2*y2;
	if( t2 < 0) n2 = 0;
	else
	{
	    t2 *= t2;
    
	    var h = global.GMMath_int_PERMUTATION[ii + 1 + global.GMMath_int_PERMUTATION[jj + 1]] & 7;
	    var u, v;
	    if (h < 4) {u = x2; v = y2;}
	    else {u = y2; v = x2;}
    
	    var final_val;
	    if ((h & 1) != 0) {final_val = -u;}
	    else {final_val = u;}
	    if ((h & 2) != 0) {final_val += -2*v;}
	    else {final_val += 2*v;}
    
	    n2 = t2 * t2 * final_val;
	}

	return 40 * (n0 + n1 + n2);

}


/**
 * Returns the a random value using simplex noise distribution
 * 
 * The return value is always in the range [0.0,1.0].
 * It is repeatable, in that a particular input value will always produce the same return value
 * @param	{Real} val_x		Value to be used to seed the noise function
 * @param	{Real} val_y		Value to be used to seed the noise function
 * @param	{Real} val_z		Value to be used to seed the noise function
 * @returns	{Real}
 */
function simplex_noise_3D(val_x, val_y, val_z) {
	gml_pragma("forceinline");
	
	var n0, n1, n2, n3;


	var s = (val_x + val_y + val_z) * 0.333333333;
	var i = floor(val_x + s);
	var j = floor(val_y + s);
	var k = floor(val_z + s);

	var t = (i + j + k) * 0.166666667;
	var x0 = val_x - (i - t);
	var y0 = val_y - (j - t);
	var z0 = val_z - (k - t);


	var i1, j1, k1;
	var i2, j2, k2;


	if(x0 >= y0) {
	    if(y0 >= z0)
	    { i1=1; j1=0; k1=0; i2=1; j2=1; k2=0; }
	    else if(x0 >= z0) { i1=1; j1=0; k1=0; i2=1; j2=0; k2=1; }
	    else { i1=0; j1=0; k1=1; i2=1; j2=0; k2=1; }
	    }
	else {
	    if(y0 < z0) { i1=0; j1=0; k1=1; i2=0; j2=1; k2=1; }
	    else if(x0 < z0) { i1=0; j1=1; k1=0; i2=0; j2=1; k2=1; }
	    else { i1=0; j1=1; k1=0; i2=1; j2=1; k2=0; }
	}


	var x1 = x0 - i1 + 0.166666667;
	var y1 = y0 - j1 + 0.166666667;
	var z1 = z0 - k1 + 0.166666667;
	var x2 = x0 - i2 + 0.333333333;
	var y2 = y0 - j2 + 0.333333333;
	var z2 = z0 - k2 + 0.333333333;
	var x3 = x0 - 0.5;
	var y3 = y0 - 0.5;
	var z3 = z0 - 0.5;


	var ii = ((i mod 256) + 256) mod 256;
	var jj = ((j mod 256) + 256) mod 256;
	var kk = ((k mod 256) + 256) mod 256;


	var t0 = 0.6 - x0*x0 - y0*y0 - z0*z0;
	if(t0 < 0) n0 = 0;
	else {
	    t0 *= t0;
	    //
	    var h = global.GMMath_int_PERMUTATION[ii + global.GMMath_int_PERMUTATION[jj + global.GMMath_int_PERMUTATION[kk]]] & 15;
	    var u, v;
	    if (h < 8) {u = x0;}
	    else {u = y0;}
    
	    if (h < 4) {v = y0;}
	    else
	    {
	        if (h == 12 || h == 14) {v = x0;}
	        else {v = z0;}
	    }
    
	    var final_val;
	    if ((h&1) != 0) {final_val = -u;}
	    else {final_val = u;}
	    if ((h&2) != 0) {final_val += -v;}
	    else {final_val += v;}
	    //
	    n0 = t0 * t0 * final_val;
	}

	var t1 = 0.6 - x1*x1 - y1*y1 - z1*z1;
	if(t1 < 0) n1 = 0;
	else {
	    t1 *= t1;
	    //
	    var h = global.GMMath_int_PERMUTATION[ii + i1 + global.GMMath_int_PERMUTATION[jj + j1 + global.GMMath_int_PERMUTATION[kk + k1]]] & 15;
	    var u, v;
	    if (h < 8) {u = x1;}
	    else {u = y1;}
    
	    if (h < 4) {v = y1;}
	    else
	    {
	        if (h == 12 || h == 14) {v = x1;}
	        else {v = z1;}
	    }
    
	    var final_val;
	    if ((h&1) != 0) {final_val = -u;}
	    else {final_val = u;}
	    if ((h&2) != 0) {final_val += -v;}
	    else {final_val += v;}
	    //
	    n1 = t1 * t1 * final_val;
	}

	var t2 = 0.6 - x2*x2 - y2*y2 - z2*z2;
	if(t2 < 0) n2 = 0;
	else {
	    t2 *= t2;
	    //
	    var h = global.GMMath_int_PERMUTATION[ii + i2 + global.GMMath_int_PERMUTATION[jj + j2 + global.GMMath_int_PERMUTATION[kk + k2]]] & 15;
	    var u, v;
	    if (h < 8) {u = x2;}
	    else {u = y2;}
    
	    if (h < 4) {v = y2;}
	    else
	    {
	        if (h == 12 || h == 14) {v = x2;}
	        else {v = z2;}
	    }
    
	    var final_val;
	    if ((h&1) != 0) {final_val = -u;}
	    else {final_val = u;}
	    if ((h&2) != 0) {final_val += -v;}
	    else {final_val += v;}
	    //
	    n2 = t2 * t2 * final_val;
	}

	var t3 = 0.6 - x3*x3 - y3*y3 - z3*z3;
	if(t3 < 0) n3 = 0;
	else {
	    t3 *= t3;
	    //
	    var h = global.GMMath_int_PERMUTATION[ii + 1 + global.GMMath_int_PERMUTATION[jj + 1 + global.GMMath_int_PERMUTATION[kk + 1]]] & 15;
	    var u, v;
	    if (h < 8) {u = x3;}
	    else {u = y3;}
    
	    if (h < 4) {v = y3;}
	    else
	    {
	        if (h == 12 || h == 14) {v = x3;}
	        else {v = z3;}
	    }
    
	    var final_val;
	    if ((h&1) != 0) {final_val = -u;}
	    else {final_val = u;}
	    if ((h&2) != 0) {final_val += -v;}
	    else {final_val += v;}
	    //
	    n3 = t3 * t3 * final_val;
	}


	return 32 * (n0 + n1 + n2 + n3);

}


#region Internal things, do not touch

gml_pragma("global", "init_simplex_noise()");
/// @ignore
/// Initializes the permutation table for the simplex noise functions
function init_simplex_noise() {
	gml_pragma("forceinline");
	
	/// @ignore
	global.GMMath_int_PERMUTATION = 
		[151,160,137,91,90,15,131,13,201,95,96,53,194,233,7,225,140,36,103,30,69,142,8,99,37,240,21,10,23,190,6,148,247,120,234,75,0,26,197,62,94,
		252,219,203,117,35,11,32,57,177,33,88,237,149,56,87,174,20,125,136,171,168,68,175,74,165,71,134,139,48,27,166,77,146,158,231,83,111,229,
		122,60,211,133,230,220,105,92,41,55,46,245,40,244,102,143,54,65,25,63,161,1,216,80,73,209,76,132,187,208,89,18,169,200,196,135,130,116,188,
		159,86,164,100,109,198,173,186,3,64,52,217,226,250,124,123,5,202,38,147,118,126,255,82,85,212,207,206,59,227,47,16,58,17,182,189,28,42,223,
		183,170,213,119,248,152,2,44,154,163,70,221,153,101,155,167,43,172,9,129,22,39,253,19,98,108,110,79,113,224,232,178,185,112,104,218,246,97,
		228,251,34,242,193,238,210,144,12,191,179,162,241,81,51,145,235,249,14,239,107,49,192,214,31,181,199,106,157,184,84,204,176,115,121,50,45,
		127,4,150,254,138,236,205,93,222,114,67,29,24,72,243,141,128,195,78,66,215,61,156,180,151,160,137,91,90,15,131,13,201,95,96,53,194,233,7,
		225,140,36,103,30,69,142,8,99,37,240,21,10,23,190,6,148,247,120,234,75,0,26,197,62,94,252,219,203,117,35,11,32,57,177,33,88,237,149,56,87,
		174,20,125,136,171,168,68,175,74,165,71,134,139,48,27,166,77,146,158,231,83,111,229,122,60,211,133,230,220,105,92,41,55,46,245,40,244,102,
		143,54,65,25,63,161,1,216,80,73,209,76,132,187,208,89,18,169,200,196,135,130,116,188,159,86,164,100,109,198,173,186,3,64,52,217,226,250,124,
		123,5,202,38,147,118,126,255,82,85,212,207,206,59,227,47,16,58,17,182,189,28,42,223,183,170,213,119,248,152,2,44,154,163,70,221,153,101,155,
		167,43,172,9,129,22,39,253,19,98,108,110,79,113,224,232,178,185,112,104,218,246,97,228,251,34,242,193,238,210,144,12,191,179,162,241,81,51,
		145,235,249,14,239,107,49,192,214,31,181,199,106,157,184,84,204,176,115,121,50,45,127,4,150,254,138,236,205,93,222,114,67,29,24,72,243,141,
		128,195,78,66,215,61,156,180];
}

#endregion