#include "Octahedron.hlsli"

VSOutput main(VSInput input)
{
	VSOutput output;
	output.pos = input.pos;//�ʒu   
	output.Radius = input.Radius;//�ʒu   
	output.color = input.color;
	output.Lighting = input.Lighting;
	return output;
}