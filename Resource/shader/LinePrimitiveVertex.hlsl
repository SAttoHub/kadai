#include "LinePrimitive.hlsli"

VSOutput main(VSInput input)
{
	VSOutput output;
	output.pos1 = input.pos1;//�ʒu   
	output.pos2 = input.pos2;//�ʒu   
	output.color = input.color;
	return output;
}