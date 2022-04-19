cbuffer cbuff0 : register(b0)
{
	matrix mat;
};

struct VSInput
{
	float4 pos1	: POSITION;//�ʒu   
	float4 pos2	: TEXCOORD;//�ʒu   
	float4 color : COLOR;
	bool Draw3D : FLAG;
};

struct VSOutput
{
	float4 pos1	: SV_POSITION;//�ʒu   
	float4 pos2	: TEXCOORD;//�ʒu   
	float4 color : COLOR;
	bool Draw3D : FLAG;
};

struct GSOutput
{
	float4 svpos : SV_POSITION;
	float2 uv  :TEXCOORD;
	float4 color : COLOR;
};