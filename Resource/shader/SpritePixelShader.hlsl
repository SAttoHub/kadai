#include "SpriteShaderHeader.hlsli"

Texture2D<float4> tex : register(t0); //0�Ԃɐݒ肳�ꂽ�e�N�X�`��
SamplerState smp : register(s0); //0�Ԃɐݒ肳�ꂽ�T���v���[

float4 PSmain(VSOutput input) : SV_TARGET
{
	if (color.a == 0) discard;
	return tex.Sample(smp, input.uv) * color;
}