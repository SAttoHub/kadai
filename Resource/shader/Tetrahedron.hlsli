
cbuffer cbuff0 : register(b0)
{
	matrix mat;
	matrix matBillboard;
};

struct VSInput
{
	float4 pos1	: POSITION;//�ʒu   
	float4 pos2	: POSITIONA;//�ʒu   
	float4 pos3	: POSITIONB;//�ʒu   
	float4 pos4	: POSITIONC;//�ʒu   
	float4 color : COLOR;
	bool Lighting : LIGHTING;
};

struct VSOutput
{
	float4 pos1	: SV_POSITION;//�ʒu   
	float4 pos2	: TEXCOORDA;//�ʒu   
	float4 pos3	: TEXCOORDB;//�ʒu   
	float4 pos4	: TEXCOORDC;//�ʒu   
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