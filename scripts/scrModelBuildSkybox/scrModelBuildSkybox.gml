
function scrModelBuildSkybox() {
	var radius = 16000;
	var segments = 64;
	var rings = 32;

    // Creazione del vertex buffer
    var vbuf = vertex_create_buffer();
    vertex_begin(vbuf, global.ue_vertex_format);

    for (var ring = 0; ring < rings; ring++) {
        var theta1 = pi * (ring / rings);
        var theta2 = pi * ((ring + 1) / rings);

        for (var seg = 0; seg <= segments; seg++) {
            var phi = (2 * pi * seg) / segments;

            // Primo punto (basso)
            var x1 = radius * sin(theta1) * cos(phi);
            var y1 = radius * cos(theta1);
            var z1 = radius * sin(theta1) * sin(phi);
            var u1 = seg / segments;
            var v1 = ring / rings;

            // Secondo punto (alto)
            var x2 = radius * sin(theta2) * cos(phi);
            var y2 = radius * cos(theta2);
            var z2 = radius * sin(theta2) * sin(phi);
            var u2 = seg / segments;
            var v2 = (ring + 1) / rings;

            // Terzo punto (basso prossimo)
            var phi_next = (2 * pi * (seg + 1)) / segments;
            var x3 = radius * sin(theta1) * cos(phi_next);
            var y3 = radius * cos(theta1);
            var z3 = radius * sin(theta1) * sin(phi_next);
            var u3 = (seg + 1) / segments;

            var x4 = radius * sin(theta2) * cos(phi_next);
            var y4 = radius * cos(theta2);
            var z4 = radius * sin(theta2) * sin(phi_next);
            var u4 = (seg + 1) / segments;
            var v4 = (ring + 1) / rings;

            // Normali invertite per il culling interno
            var nx1 = -x1 / radius, ny1 = -y1 / radius, nz1 = -z1 / radius;
            var nx2 = -x2 / radius, ny2 = -y2 / radius, nz2 = -z2 / radius;
            var nx3 = -x3 / radius, ny3 = -y3 / radius, nz3 = -z3 / radius;
            var nx4 = -x4 / radius, ny4 = -y4 / radius, nz4 = -z4 / radius;

            // Colore base (bianco)
            var color = c_white;

            // Primo triangolo (invertito)
            vertex_position_3d(vbuf, x1, y1, z1);
            vertex_normal(vbuf, nx1, ny1, nz1);
            vertex_texcoord(vbuf, u1, v1);
            vertex_color(vbuf, color, 1);

            vertex_position_3d(vbuf, x2, y2, z2);
            vertex_normal(vbuf, nx2, ny2, nz2);
            vertex_texcoord(vbuf, u2, v2);
            vertex_color(vbuf, color, 1);

            vertex_position_3d(vbuf, x3, y3, z3);
            vertex_normal(vbuf, nx3, ny3, nz3);
            vertex_texcoord(vbuf, u3, v1);
            vertex_color(vbuf, color, 1);

            // Secondo triangolo (invertito)
            vertex_position_3d(vbuf, x3, y3, z3);
            vertex_normal(vbuf, nx3, ny3, nz3);
            vertex_texcoord(vbuf, u3, v1);
            vertex_color(vbuf, color, 1);

            vertex_position_3d(vbuf, x2, y2, z2);
            vertex_normal(vbuf, nx2, ny2, nz2);
            vertex_texcoord(vbuf, u2, v2);
            vertex_color(vbuf, color, 1);

            vertex_position_3d(vbuf, x4, y4, z4);
            vertex_normal(vbuf, nx4, ny4, nz4);
            vertex_texcoord(vbuf, u4, v4);
            vertex_color(vbuf, color, 1);
        }
    }

    vertex_end(vbuf);
	vertex_freeze(vbuf);

    return vbuf;
}
