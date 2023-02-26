// @author		Giacomo Marton
// @version		1.0.0


/**
 * This function returns the index of the given cell for directly reading the matrix as an array instead of using functions.
 * @param	{Real} mx		The x coordinate in the grid (with standard matrices this must be 0, 1, 2 or 3)
 * @param	{Real} my		The y coordinate in the grid (with standard matrices this must be 0, 1, 2 or 3)
 * @returns	{Real}
 */
function mat4_get_index(mx, my) {
	gml_pragma("forceinline");
	
	return mx * 4.0 + my;

}
