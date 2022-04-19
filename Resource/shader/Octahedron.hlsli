
cbuffer cbuff0 : register(b0)
{
	matrix mat;
	matrix matBillboard;
};

struct VSInput
{
	float4 pos	: POSITION;//�ʒu   
	float Radius	: TEXCOORD;//�ʒu   
	float4 color : COLOR;
	bool Lighting : LIGHTING;
};

struct VSOutput
{
	float4 pos	: SV_POSITION;//�ʒu   
	float Radius	: TEXCOORD;//�ʒu   
	float4 color : COLOR;
	bool Lighting : LIGHTING;
};

struct GSOutput
{
	float4 svpos : SV_POSITION;
	float3 normal : NORMAL;
	float4 color : COLOR;
	bool Lighting : LIGHTING;
};