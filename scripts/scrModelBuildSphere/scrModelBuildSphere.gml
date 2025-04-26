function scrModelBuildSphere(color=c_white, radius=1, segments=16, rings=16) {
    var vbuff = vertex_create_buffer();
	vertex_begin(vbuff, global.ue_vertex_format);
	
	// Creazione dei triangoli tramite vertici
    for (var ring = 0; ring < rings; ring++) {
        var theta1 = (ring / rings) * pi; // Latitudine superiore
        var theta2 = ((ring + 1) / rings) * pi; // Latitudine inferiore

        for (var segment = 0; segment < segments; segment++) {
            var phi1 = (segment / segments) * 2 * pi; // Longitudine sinistra
            var phi2 = ((segment + 1) / segments) * 2 * pi; // Longitudine destra

            // Calcola i quattro vertici del rettangolo
            var vertices = [
                [radius * sin(theta1) * cos(phi1), radius * cos(theta1), radius * sin(theta1) * sin(phi1), phi1 / (2 * pi), theta1 / pi],
                [radius * sin(theta2) * cos(phi1), radius * cos(theta2), radius * sin(theta2) * sin(phi1), phi1 / (2 * pi), theta2 / pi],
                [radius * sin(theta2) * cos(phi2), radius * cos(theta2), radius * sin(theta2) * sin(phi2), phi2 / (2 * pi), theta2 / pi],
                [radius * sin(theta1) * cos(phi2), radius * cos(theta1), radius * sin(theta1) * sin(phi2), phi2 / (2 * pi), theta1 / pi]
            ];

            // Indici per i triangoli
            var triangles = [
                [0, 1, 2], // Primo triangolo
                [0, 2, 3]  // Secondo triangolo
            ];

            // Scrive i vertici nel vertex buffer
            for (var t = 0; t < 2; t++) { // Due triangoli
                for (var i = 0; i < 3; i++) { // Tre vertici per triangolo
                    var v = vertices[triangles[t][i]];

                    // Precalcola i valori necessari
                    var pos_x = v[0], pos_y = v[1], pos_z = v[2];
                    var norm_x = v[0] / radius, norm_y = v[1] / radius, norm_z = v[2] / radius;
                    var tex_u = v[3], tex_v = v[4];

                    vertex_position_3d(vbuff, pos_x, pos_y, pos_z);
                    vertex_normal(vbuff, norm_x, norm_y, norm_z);
                    vertex_texcoord(vbuff, tex_u, tex_v);
                    vertex_color(vbuff, color, 1);
                }
            }
        }
    }

    // Chiude il vertex buffer
    vertex_end(vbuff);
	vertex_freeze(vbuff);
	return vbuff;
}