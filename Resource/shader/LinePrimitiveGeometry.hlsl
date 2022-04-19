#include "LinePrimitive.hlsli"

[maxvertexcount(2)]
void main(
	point VSOutput input[1],
	inout LineStream< GSOutput > output
)
{
	GSOutput element[2];

	element[0].svpos = float4(input[0].pos1.x, input[0].pos1.y, input[0].pos1.z, 1);
	element[1].svpos = float4(input[0].pos2.x, input[0].pos2.y, input[0].pos2.z, 1);

	for (int i = 0; i < 2; i++) {
		element[i].color = input[0].color;
		element[i].svpos = mul(mat, element[i].svpos);
		output.Append(element[i]);
	}
}

