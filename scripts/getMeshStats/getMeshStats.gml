function getMeshStats(mesh, stats = { faces_count: 0, vertices_count: 0, meshes_count: 0 }) {
	if (mesh.vbuff) {
		stats.faces_count += stats.faces_count + mesh.faces_count;
		stats.vertices_count += stats.vertices_count + mesh.vertices_count;
		stats.meshes_count++;
	}
	
	var children = mesh.children;
	for (var i=0, len=mesh.children_length; i<len; i++) {
		getMeshStats(children[i], stats);
	}
	
	return stats;
}