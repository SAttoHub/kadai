#include "CubePrimitive.hlsli"

[maxvertexcount(24)]
void main(
	point VSOutput input[1],
	inout TriangleStream< GSOutput > output
)
{
	GSOutput element[24];

	for (int i = 0; i < 24; i++) {
		element[i].svpos = float4(0,0,0,0);
		element[i].uv = float2(0,0);
		element[i].normal = float3(0,0,0);
		element[i].color = float4(1,1,1,1);
		element[i].Lighting = false;
	}

	element[0].svpos = float4(input[0].pos1.x, input[0].pos2.y, input[0].pos1.z, 1);
	element[1].svpos = float4(input[0].pos2.x, input[0].pos2.y, input[0].pos1.z, 1);
	element[2].svpos = float4(input[0].pos1.x, input[0].pos1.y, input[0].pos1.z, 1);
	element[3].svpos = float4(input[0].pos2.x, input[0].pos1.y, input[0].pos1.z, 1);
	element[0].uv = float2(0.0f, 1.0f);
	element[1].uv = float2(0.0f, 0.0f);
	element[2].uv = float2(1.0f, 1.0f);
	element[3].uv = float2(1.0f, 0.0f);
	element[0].normal.x = 0.0f;
	element[0].normal.y = 0.0f;
	element[0].normal.z = -1.0f;
	element[1].normal = element[0].normal;
	element[2].normal = element[0].normal;
	element[3].normal = element[0].normal;

	element[5].svpos = float4(input[0].pos1.x, input[0].pos2.y, input[0].pos2.z, 1);
	element[6].svpos = float4(input[0].pos2.x, input[0].pos1.y, input[0].pos2.z, 1);
	element[7].svpos = float4(input[0].pos1.x, input[0].pos1.y, input[0].pos2.z, 1);
	element[4].svpos = float4(input[0].pos2.x, input[0].pos2.y, input[0].pos2.z, 1);
	element[4].uv = float2(0.0f, 1.0f);
	element[5].uv = float2(0.0f, 0.0f);
	element[6].uv = float2(1.0f, 1.0f);
	element[7].uv = float2(1.0f, 0.0f);
	element[4].normal.x = 0.0f;
	element[4].normal.y = 0.0f;
	element[4].normal.z = 1.0f;
	element[5].normal = element[4].normal;
	element[6].normal = element[4].normal;
	element[7].normal = element[4].normal;

	element[8].svpos = float4(input[0].pos1.x, input[0].pos2.y, input[0].pos2.z, 1);
	element[9].svpos = float4(input[0].pos1.x, input[0].pos2.y, input[0].pos1.z, 1);
	element[10].svpos = float4(input[0].pos1.x, input[0].pos1.y, input[0].pos2.z, 1);
	element[11].svpos = float4(input[0].pos1.x, input[0].pos1.y, input[0].pos1.z, 1);
	element[8].uv = float2(0.0f, 1.0f);
	element[9].uv = float2(0.0f, 0.0f);
	element[10].uv = float2(1.0f, 1.0f);
	element[11].uv = float2(1.0f, 0.0f);
	element[8].normal.x = -1.0f;
	element[8].normal.y = 0.0f;
	element[8].normal.z = 0.0f;
	element[9].normal = element[8].normal;
	element[10].normal = element[8].normal;
	element[11].normal = element[8].normal;

	element[12].svpos = float4(input[0].pos2.x, input[0].pos2.y, input[0].pos1.z, 1);
	element[13].svpos = float4(input[0].pos2.x, input[0].pos2.y, input[0].pos2.z, 1);
	element[14].svpos = float4(input[0].pos2.x, input[0].pos1.y, input[0].pos1.z, 1);
	element[15].svpos = float4(input[0].pos2.x, input[0].pos1.y, input[0].pos2.z, 1);
	element[12].uv = float2(0.0f, 1.0f);
	element[13].uv = float2(0.0f, 0.0f);
	element[14].uv = float2(1.0f, 1.0f);
	element[15].uv = float2(1.0f, 0.0f);
	element[12].normal.x = 1.0f;
	element[12].normal.y = 0.0f;
	element[12].normal.z = 0.0f;
	element[13].normal = element[12].normal;
	element[14].normal = element[12].normal;
	element[15].normal = element[12].normal;

	element[16].svpos = float4(input[0].pos1.x, input[0].pos2.y, input[0].pos2.z, 1);
	element[17].svpos = float4(input[0].pos2.x, input[0].pos2.y, input[0].pos2.z, 1);
	element[18].svpos = float4(input[0].pos1.x, input[0].pos2.y, input[0].pos1.z, 1);
	element[19].svpos = float4(input[0].pos2.x, input[0].pos2.y, input[0].pos1.z, 1);
	element[16].uv = float2(0.0f, 1.0f);
	element[17].uv = float2(0.0f, 0.0f);
	element[18].uv = float2(1.0f, 1.0f);
	element[19].uv = float2(1.0f, 0.0f);
	element[16].normal.x = 0.0f;
	element[16].normal.y = 1.0f;
	element[16].normal.z = 0.0f;
	element[17].normal = element[16].normal;
	element[18].normal = element[16].normal;
	element[19].normal = element[16].normal;

	element[20].svpos = float4(input[0].pos1.x, input[0].pos1.y, input[0].pos1.z, 1);
	element[21].svpos = float4(input[0].pos2.x, input[0].pos1.y, input[0].pos1.z, 1);
	element[22].svpos = float4(input[0].pos1.x, input[0].pos1.y, input[0].pos2.z, 1);
	element[23].svpos = float4(input[0].pos2.x, input[0].pos1.y, input[0].pos2.z, 1);
	element[20].uv = float2(0.0f, 1.0f);
	element[21].uv = float2(0.0f, 0.0f);
	element[22].uv = float2(1.0f, 1.0f);
	element[23].uv = float2(1.0f, 0.0f);
	element[20].normal.x = 0.0f;
	element[20].normal.y = -1.0f;
	element[20].normal.z = 0.0f;
	element[21].normal = element[20].normal;
	element[22].normal = element[20].normal;
	element[23].normal = element[20].normal;

	/*for (int i = 0; i < 24; i++) {
		element[i].color = input[0].color;
		element[i].svpos = mul(mat, element[i].svpos);
		element[i].Lighting = input[0].Lighting;
		output.Append(element[i]);
	}*/
	[unroll]
	for (int i = 0; i < 6; i++) {
		[unroll]
		for (int j = 0; j < 4; j++) {
			const int a = i * 4 + j;
			element[a].color = input[0].color;
			element[a].svpos = mul(mat, element[a].svpos);
			element[a].Lighting = input[0].Lighting;
			output.Append(element[a]);
		}
		output.RestartStrip();
	}

}

