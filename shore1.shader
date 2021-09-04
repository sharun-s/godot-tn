shader_type canvas_item;

uniform float square_size = 0.005;
uniform vec4 from : hint_color = vec4(0.2, 0.2, 1.0, 1.0);
uniform vec4 to : hint_color = vec4(0.4, 1.0, 1.0, 1.0);

float rand(float seed) {
    return fract(sin(dot(vec2(seed, 10), vec2(12.9898,78.233))) * 43758.5453);
}

void fragment() {
    COLOR *= mix(from, to, rand(float(int(UV.y / square_size)) * square_size + TIME / 100000.0));
}

//////render_mode blend_add;
//uniform float reflectionBlur = 0; // works only if project's driver is set to GLES3, more information here https://docs.godotengine.org/ru/stable/tutorials/shading/screen-reading_shaders.html
//uniform float calculatedOffset = 0; // this is controlled by script, it takes into account camera position and water object position, that way reflection stays in the same place when camera is moving
//uniform sampler2D noiseTexture;
////
//uniform vec2 distortionScale = vec2(0.3, 0.3);
//uniform vec2 distortionSpeed = vec2(0.01, 0.02);
//uniform vec2 distortionStrength = vec2(0.3, 0.3);
////
//uniform float waveSmoothing = .1;
////
//uniform float mainWaveSpeed = 2.5;
//uniform float mainWaveFrequency = 10;
//uniform float mainWaveAmplitude = 0.015;
////
//uniform vec4 shorelineColor : hint_color = vec4(1.);
//uniform float shorelineSize : hint_range(0., 1.) = 0.025;
//uniform float foamSize : hint_range(0., 1.0) = 0.125;
//uniform float foamStrength : hint_range(0., 1.0) = 0.5;
//uniform float foamSpeed;
//uniform vec2 foamScale;
////
//void fragment()
//{
//	vec2 size=TEXTURE_PIXEL_SIZE;
//	vec4 color = COLOR;//vec4(0.0,.3,.9,.5);
//	vec2 uv = UV;
//	vec4 tcol=texture(TEXTURE, UV);
////	vec4 tcolleft=texture(TEXTURE, UV+vec2(size.x+10.,0.0));
////	vec4 tcolup=texture(TEXTURE, UV+vec2(0.0, size.y-10.0));
////	//vec4 tcoldown=texture(TEXTURE, UV+vec2(0.0, size.y+10.));
////
////	if (tcol!=tcolup && tcol!=tcolleft){
//		vec2 noiseTextureUV = UV * distortionScale; 
//		noiseTextureUV += TIME * distortionSpeed; // scroll noise over time
////
//		vec2 waterDistortion = texture(noiseTexture, noiseTextureUV).rg;
//		waterDistortion.rg *= distortionStrength.xy;
//		waterDistortion.rg = smoothstep(0.0, 1., waterDistortion.rg); 
//		uv += waterDistortion;
//		float distFromLeft = TIME;// * mainWaveSpeed)+mainWaveAmplitude;
//		float waveArea =  distFromLeft;
////		waveArea = smoothstep(0., 1. * waveSmoothing, waveArea);
//		color.a *= waveArea;
////	} else{
////		color=tcol;		
////	}
//		//uv.y = 1. - uv.y; // turning screen uvs upside down
//		//uv.y -= calculatedOffset;
//
//	float shorelineBottom = UV.x - distFromLeft - shorelineSize;
//	shorelineBottom = smoothstep(0., 1. * waveSmoothing,  shorelineBottom);
//	float shoreline = waveArea - shorelineBottom;
//	color.rgb += shoreline * shorelineColor.rgb;
////
//	vec4 foamNoise = texture(noiseTexture, UV* foamScale + TIME * foamSpeed);
//	foamNoise.r = smoothstep(0.0, foamNoise.r, foamStrength); 
//
//	float shorelineFoam = UV.x - distFromLeft;
//	shorelineFoam = smoothstep(0.0, shorelineFoam, foamSize);
//	shorelineFoam *= foamNoise.r;
//	color.rgb += shorelineFoam * shorelineColor.rgb;
//	COLOR = color;
//}