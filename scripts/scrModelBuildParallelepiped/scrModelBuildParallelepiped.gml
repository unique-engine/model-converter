/**
 @note: This function uses absolute world coordinates
 */
function scrModelBuildParallelepiped(x1, y1, z1, x2, y2, z2, color = c_white, _vbuff = undefined) {
	var vbuff;
	if (_vbuff == undefined) {
	    vbuff = vertex_create_buffer();
		vertex_begin(vbuff, global.ue_vertex_format);
	} else {
		vbuff = _vbuff;
	}

    var vertices = [
        [x1, y1, z1], // v0: Inferiore Sinistro Posteriore
        [x2, y1, z1], // v1: Inferiore Destro Posteriore
        [x2, y2, z1], // v2: Superiore Destro Posteriore
        [x1, y2, z1], // v3: Superiore Sinistro Posteriore
        [x1, y1, z2], // v4: Inferiore Sinistro Anteriore
        [x2, y1, z2], // v5: Inferiore Destro Anteriore
        [x2, y2, z2], // v6: Superiore Destro Anteriore
        [x1, y2, z2]  // v7: Superiore Sinistro Anteriore
    ];

    // Definisci le linee (ogni coppia rappresenta un segmento)
    var edges = [
        // Bordi della base posteriore
        [0, 1], [1, 2], [2, 3], [3, 0],
        // Bordi della base anteriore
        [4, 5], [5, 6], [6, 7], [7, 4],
        // Colonne verticali
        [0, 4], [1, 5], [2, 6], [3, 7]
    ];

    // Scrittura delle linee nel vertex buffer
    for (var i = 0; i < array_length(edges); i++) {
        var edge = edges[i];
        for (var v = 0; v < 2; v++) { // Ogni linea ha due vertici
            var vert_index = edge[v];
            var pos_x = vertices[vert_index][0];
            var pos_y = vertices[vert_index][1];
            var pos_z = vertices[vert_index][2];

            vertex_position_3d(vbuff, pos_x, pos_y, pos_z);
            vertex_normal(vbuff, 0, 0, 0); // Normale neutra
            vertex_texcoord(vbuff, 0, 0); // Texcoord neutra
            vertex_color(vbuff, color, 1); // Colore bianco
        }
    }
	
	if (_vbuff == undefined) {
		vertex_end(vbuff);
		vertex_freeze(vbuff);
		return vbuff;
	}
}
