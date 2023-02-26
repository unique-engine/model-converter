// @author		Giacomo Marton
// @version		1.0.0


/**
 * Creates a plane
 * @param	{Real} ax		Factor x of the plane normal
 * @param	{Real} ay		Factor y of the plane normal
 * @param	{Real} az		Factor z of the plane normal
 * @param	{Real} d		Distance from origin
 * @returns	{Array<Real>}	(Plane)
  */
function plane_set(ax, ay, az, d) {
	gml_pragma("forceinline");
	
	return [ax, ay, az, d];

}
