#include "Tetrahedron.hlsli"

VSOutput main(VSInput input)
{
	VSOutput output;
	output.pos1 = input.pos1;//�ʒu   
	output.pos2 = input.pos2;//�ʒu   
	output.pos3 = input.pos3;//�ʒu   
	output.pos4 = input.pos4;//�ʒu   
	output.color = input.color;
	output.Lighting = input.Lighting;
	return output;
}