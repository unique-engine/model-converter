function scrModelBuildCube(cx, cy, cz, size, col, _vbuff = undefined) {
    var vbuff;
	if (_vbuff == undefined) {
	    vbuff = vertex_create_buffer();
		vertex_begin(vbuff, global.ue_vertex_format);
	} else {
		vbuff = _vbuff;
	}
	
	var hs = size / 2; // Half size
    var vertices = [
        [cx - hs, cy - hs, cz - hs], [cx + hs, cy - hs, cz - hs], [cx + hs, cy + hs, cz - hs], [cx - hs, cy + hs, cz - hs], // Base
        [cx - hs, cy - hs, cz + hs], [cx + hs, cy - hs, cz + hs], [cx + hs, cy + hs, cz + hs], [cx - hs, cy + hs, cz + hs]  // Top
    ];
    var faces = [
        [0, 1, 2], [0, 2, 3], // Bottom
        [4, 5, 6], [4, 6, 7], // Top
        [0, 1, 5], [0, 5, 4], // Side 1
        [1, 2, 6], [1, 6, 5], // Side 2
        [2, 3, 7], [2, 7, 6], // Side 3
        [3, 0, 4], [3, 4, 7]  // Side 4
    ];

    for (var i = 0; i < array_length(faces); i++) {
        var f = faces[i];
        for (var j = 0; j < 3; j++) {
            var v = vertices[f[j]];
            vertex_position_3d(vbuff, v[0], v[1], v[2]);
            vertex_normal(vbuff, 0, 0, 0);
            vertex_texcoord(vbuff, 0, 0);
            vertex_color(vbuff, col, 1);
        }
    }
	
	if (_vbuff == undefined) {
		vertex_end(vbuff);
		vertex_freeze(vbuff);
		return vbuff;
	}
}