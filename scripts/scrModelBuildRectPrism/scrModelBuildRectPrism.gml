/**
 * Similar to a parallelepiped but used for the grid axes
 * @note: This function uses absolute world coordinates
 */
function scrModelBuildRectPrism(x1, y1, z1, x2, y2, z2, color = c_white, _vbuff = undefined) {
	var vbuff;
	if (_vbuff == undefined) {
	    vbuff = vertex_create_buffer();
		vertex_begin(vbuff, global.ue_vertex_format);
	} else {
		vbuff = _vbuff;
	}

	var hw = .1 / 2; // Half width for easier calculations

    // Calculate the direction vector
    var dx = x2 - x1;
    var dy = y2 - y1;
    var dz = z2 - z1;
    var length = sqrt(dx * dx + dy * dy + dz * dz);

    // Normalize direction vector
    if (length == 0) return; // Prevent division by zero
    dx /= length;
    dy /= length;
    dz /= length;

    // Find two perpendicular vectors for the width (cross products)
    var ux, uy, uz, vx, vy, vz;
    if (abs(dx) < 0.01 && abs(dy) < 0.01) {
        // Line is vertical, use XY plane
        ux = 1; uy = 0; uz = 0;
        vx = 0; vy = 1; vz = 0;
    } else {
        // General case
        ux = -dy; uy = dx; uz = 0;
        var ul = sqrt(ux * ux + uy * uy + uz * uz); // Normalize
        ux /= ul; uy /= ul; uz /= ul;

        // Second perpendicular vector (cross product of direction and ux vector)
        vx = dy * uz - dz * uy;
        vy = dz * ux - dx * uz;
        vz = dx * uy - dy * ux;
        var vl = sqrt(vx * vx + vy * vy + vz * vz); // Normalize
        vx /= vl; vy /= vl; vz /= vl;
    }

    // Scale perpendicular vectors by half-width
    ux *= hw; uy *= hw; uz *= hw;
    vx *= hw; vy *= hw; vz *= hw;

    // Define the 8 vertices of the parallelepiped
    var vertices = [
        [x1 - ux - vx, y1 - uy - vy, z1 - uz - vz],
        [x1 + ux - vx, y1 + uy - vy, z1 + uz - vz],
        [x1 + ux + vx, y1 + uy + vy, z1 + uz + vz],
        [x1 - ux + vx, y1 - uy + vy, z1 - uz + vz],
        [x2 - ux - vx, y2 - uy - vy, z2 - uz - vz],
        [x2 + ux - vx, y2 + uy - vy, z2 + uz - vz],
        [x2 + ux + vx, y2 + uy + vy, z2 + uz + vz],
        [x2 - ux + vx, y2 - uy + vy, z2 - uz + vz]
    ];

    // Define the faces (as triangles)
    var faces = [
        [0, 1, 2], [0, 2, 3], // Base 1
        [4, 5, 6], [4, 6, 7], // Base 2
        [0, 1, 5], [0, 5, 4], // Side 1
        [1, 2, 6], [1, 6, 5], // Side 2
        [2, 3, 7], [2, 7, 6], // Side 3
        [3, 0, 4], [3, 4, 7]  // Side 4
    ];

    // Add vertices and faces to the buffer
    for (var i = 0; i < array_length(faces); i++) {
        var f = faces[i];
        for (var j = 0; j < 3; j++) {
            var v = vertices[f[j]];
            vertex_position_3d(vbuff, v[0], v[1], v[2]);
            vertex_normal(vbuff, 0, 0, 0);
            vertex_texcoord(vbuff, 0, 0);
            vertex_color(vbuff, color, 1);
        }
    }

	if (_vbuff == undefined) {
		vertex_end(vbuff);
		vertex_freeze(vbuff);
		return vbuff;
	}
}
