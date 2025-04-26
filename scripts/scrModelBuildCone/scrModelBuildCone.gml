function scrModelBuildCone(base_radius = 1, height = 2, segments = 16) {
    var vbuff = vertex_create_buffer();
	vertex_begin(vbuff, global.ue_vertex_format);

    // Vertice della punta del cono
    var tip_x = 0, tip_y = 0, tip_z = 0;
    var tip_normal_x = 0, tip_normal_y = -1, tip_normal_z = 0; // Normale verso il basso

    // Creazione dei triangoli laterali
    for (var i = 0; i < segments; i++) {
        var angle1 = (i / segments) * 2 * pi;
        var angle2 = ((i + 1) / segments) * 2 * pi;

        // Vertici sulla base
        var base_x1 = base_radius * cos(angle1);
        var base_z1 = base_radius * sin(angle1);
        var base_x2 = base_radius * cos(angle2);
        var base_z2 = base_radius * sin(angle2);
        var base_y = height;

        // Normali per i vertici della base (sempre verso il basso)
        var norm_x1 = 0, norm_y1 = -1, norm_z1 = 0;
        var norm_x2 = 0, norm_y2 = -1, norm_z2 = 0;

        // Triangolo: punta -> base1 -> base2
        var vertices = [
            [tip_x, tip_y, tip_z, tip_normal_x, tip_normal_y, tip_normal_z, 0.5, 0.0], // Punta
            [base_x1, base_y, base_z1, norm_x1, norm_y1, norm_z1, i / segments, 1.0], // Base1
            [base_x2, base_y, base_z2, norm_x2, norm_y2, norm_z2, (i + 1) / segments, 1.0] // Base2
        ];

        // Scrittura dei vertici nel vertex buffer
        for (var v = 0; v < 3; v++) {
            var vert = vertices[v];
            var pos_x = vert[0], pos_y = vert[1], pos_z = vert[2];
            var norm_x = vert[3], norm_y = vert[4], norm_z = vert[5];
            var tex_u = vert[6], tex_v = vert[7];

            vertex_position_3d(vbuff, pos_x, pos_y, pos_z);
            vertex_normal(vbuff, norm_x, norm_y, norm_z);
            vertex_texcoord(vbuff, tex_u, tex_v);
            vertex_color(vbuff, c_white, 1);
        }
    }

    // Chiude il vertex buffer
    vertex_end(vbuff);
	vertex_freeze(vbuff);

    return vbuff;
}
