varying vec3 v_Normal;
varying vec3 v_Position; 
varying vec2 v_Texcoord;
varying vec4 v_Colour;

uniform sampler2D s_Texture;
uniform vec3 u_LightPosition; 
uniform vec3 u_LightDirection;
uniform vec4 u_LightColor;   
uniform vec4 u_AmbientColor;    
uniform vec4 u_BacklightColor;

void main() {
    vec3 normal = normalize(v_Normal);

    // Get the pointlight direction and distance
    vec3 lightDir = normalize(u_LightPosition - v_Position);
    float dist = length(u_LightPosition - v_Position);
    
    // Get directional light (if specified)
	// @todo: not working
    //if (length(u_LightDirection) > 0.0) {
    //    lightDir = normalize(u_LightDirection);  // Se la direzione è presente, usiamo quella
    //}

    // Get the light diffusion value
	float diff = smoothstep(0.1, 1.0, max(dot(normal, lightDir), 0.0));

    // Get the light diffusion color
    vec4 diffuse = u_LightColor * diff;

    // Get the ambient occlusion value
    float ao = max(0.0, 1.0 - 0.3 * dot(normal, vec3(0.0, 1.0, 0.0)));
    
    // Get the backlight contribution
    float back = max(dot(-lightDir, normal), 0.0);
    vec4 backlight = u_BacklightColor * pow(back, 3.0);
	
	// Get the texture coordinate color
	vec4 texColor = texture2D(s_Texture, v_Texcoord);

    // Combine all values
    gl_FragColor = (diffuse + u_AmbientColor/* + backlight*/) * v_Colour * texColor;
    gl_FragColor.rgb *= ao;
	
	//gl_FragColor = vec4(normal * 0.5 + 0.5, 1.0); // @test: Normals
}
