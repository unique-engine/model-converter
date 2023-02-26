// @author		Giacomo Marton
// @version		1.0.0


/**
 * Generate a random 3D vector which coordinates are regulary distributed on a sphere of a given radius. 
 * @param	{Real} radius	The radius
 * @returns	{Array<Real>}	(Vec3)
 */
function random_ball(radius) {
	gml_pragma("forceinline");
	
	var len_radius;
	var xx, yy, zz;

	do
	{
		xx = random_range(-radius, radius);
		yy = random_range(-radius, radius);
		zz = random_range(-radius, radius);
		len_radius = sqrt(xx * xx + yy * yy + zz * zz );
	}
	until (len_radius <= radius);

	return [xx, yy, zz];

}


/**
 * Generate a random 2D vector which coordinates are regulary distributed on a circle of a given radius
 * @param	{Real} radius	The radius
 * @returns	{Array<Real>}	(Vec2)
 */
function random_circular(radius) {
	gml_pragma("forceinline");
	
	var a = random(ConstNum_two_pi);

	return [sin(a) * radius,
			cos(a) * radius];

}


/**
 * Generate a random 2D vector which coordinates are regulary distributed within the area of a disk of a given radius
 * @param	{Real} radius	The radius
 * @returns	{Array<Real>}	(Vec2)
 */
function random_disk(radius) {
	gml_pragma("forceinline");
	
	var len_radius;
	var xx, yy;

	do
	{
		xx = random_range(-radius, radius);
		yy = random_range(-radius, radius);
		len_radius = sqrt(xx * xx + yy * yy );
	}
	until (len_radius <= radius);

	return [xx, yy];

}


/**
 * Generate random numbers in the interval [Min, Max], according a gaussian distribution
 * @param	{Real} mean			The mean value
 * @param	{Real} deviation	The deviation factor
 * @returns	{Real}
 */
function random_gauss(mean, deviation) {
	gml_pragma("forceinline");
	
	var w, x1, x2;

	do
	{
		x1 = random_range(-1.0, 1.0);
		x2 = random_range(-1.0, 1.0);

		w = x1 * x1 + x2 * x2;
	} until(w <= 1.0);

	return x2 * deviation * deviation * sqrt((-2.0 * logn(ConstNum_e, w)) / w) + mean;

}


/**
 * Generate a random 3D vector which coordinates are regulary distributed on a sphere of a given radius
 * @param	{Real} radius	The radius
 * @returns	{Array<Real>}	(Vec3)
 */
function random_spherical(radius) {
	gml_pragma("forceinline");
	
	var theta = random(ConstNum_two_pi);
	var phi = arccos(random_range(-1.0, 1.0));

	return [cos(theta) * radius,
			sin (phi) * sin(theta) * radius,
			sin (phi) * cos(theta) * radius];

}
