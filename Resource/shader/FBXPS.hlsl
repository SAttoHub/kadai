#include "FBX.hlsli"

Texture2D<float4> tex : register(t0);  // 0�ԃX���b�g�ɐݒ肳�ꂽ�e�N�X�`��
SamplerState smp : register(s0);      // 0�ԃX���b�g�ɐݒ肳�ꂽ�T���v���[

//float smoothstepf(float edge0, float edge1, float x) {
//	float t = clamp((x - edge0) / (edge1 - edge0), 0, 1);
//	return t * t * (3 - 2 * t);
//}
//
//float smoothstep(float edge0, float edge1, float3 f) {
//	float3 res = { 0,0,0 };
//	res.x = smoothstepf(edge0, edge1, f.x);
//	res.y = smoothstepf(edge0, edge1, f.y);
//	res.z = smoothstepf(edge0, edge1, f.z);
//	return res;
//}

float4 main(VSOutput input) : SV_TARGET
{
	////�e�N�X�`���}�b�s���O
	//float4 texcolor = tex.Sample(smp, input.uv);
	////Lambert����
	//float3 light = normalize(float3(1,-1,1)); //�E�����@�����̃��C�g
	//float diffuse = saturate(dot(-light, input.normal));
	//float brightness = diffuse + 0.3f;
	//float4 shadecolor = float4(brightness, brightness, brightness, 1.0f);
	////�A�e�ƃe�N�X�`���̐F������
	//return shadecolor * texcolor;
	// �e�N�X�`���}�b�s���O
	float4 texcolor = tex.Sample(smp, input.uv);

	// ����x
	const float shininess = 4.0f;
	// ���_���王�_�ւ̕����x�N�g��
	float3 eyedir = normalize(cameraPos - input.worldpos.xyz);

	// �����ˌ�
	float3 ambient = m_ambient;

	// �V�F�[�f�B���O�ɂ��F
	float4 shadecolor = float4(ambientColor * ambient, m_alpha);
	shadecolor = float4(0, 0, 0, 1);
	float3 dotlightnormal = { 0, 0, 0 };
	float3 reflect = { 0, 0, 0 };
	float3 diffuse = { 0, 0, 0 };
	float3 specular = { 0, 0, 0 };
	float3 lightpos = { 0, 0, 0 };
	float3 lightv = { 0, 0, 0 };
	float d = 0;
	float atten = 0;
	float cos = 0;
	float angleatten = 0;
	float3 casterv = { 0, 0, 0 };

	//�g�D�[��
	float _DiffuseThreshold = 0.1f;
	float _DiffuseBlur = 0.05f;
	float _SpecularThreshold = 0.9f;
	float _SpecularBlur = 0.05f;
	//�A���r�G���g���Â������̂Œl�𒼐ړ����


	// ���s����
	for (int i = 0; i < DIRLIGHT_NUM; i++) {
		if (dirLights[i].active) {
			// ���C�g�Ɍ������x�N�g���Ɩ@���̓���
			dotlightnormal = dot(dirLights[i].lightv, input.normal);
			// ���ˌ��x�N�g��
			reflect = normalize(-dirLights[i].lightv + 2 * dotlightnormal * input.normal);
			//�g�D�[��
			dotlightnormal = smoothstep(_DiffuseThreshold - _DiffuseBlur, _DiffuseThreshold + _DiffuseBlur, dotlightnormal);
			// �g�U���ˌ�
			diffuse = dotlightnormal * m_diffuse;
			//�g�D�[��2
			float3 ttt = pow(saturate(dot(reflect, eyedir)), shininess);
			ttt = smoothstep(_DiffuseThreshold - _DiffuseBlur, _DiffuseThreshold + _DiffuseBlur, ttt);
			// ���ʔ��ˌ�
			specular = ttt * m_specular;
			//�e�����}�C�i�X�ɂȂ�Ȃ��悤�ɕ␳����
			float3 result = (diffuse + specular) * dirLights[i].lightcolor;
			if (result.r < 0.0f) result.r = 0.0f;
			if (result.g < 0.0f) result.g = 0.0f;
			if (result.b < 0.0f) result.b = 0.0f;
			// �S�ĉ��Z����
			shadecolor.rgb += result;
		}
	}

	// �_����
	for (i = 0; i < POINTLIGHT_NUM; i++) {
		if (pointLights[i].active) {
			// ���C�g�ւ̕����x�N�g��
			lightv = pointLights[i].lightpos - input.worldpos.xyz;
			d = length(lightv);
			lightv = normalize(lightv);

			// ���������W��
			atten = 1.0f / (pointLights[i].lightatten.x + pointLights[i].lightatten.y * d + pointLights[i].lightatten.z * d * d);
			// ���C�g�Ɍ������x�N�g���Ɩ@���̓���
			dotlightnormal = dot(lightv, input.normal);
			// ���ˌ��x�N�g��
			reflect = normalize(-lightv + 2 * dotlightnormal * input.normal);
			//�g�D�[��
			dotlightnormal = smoothstep(_DiffuseThreshold - _DiffuseBlur, _DiffuseThreshold + _DiffuseBlur, dotlightnormal);
			// �g�U���ˌ�
			diffuse = dotlightnormal * m_diffuse;
			//�g�D�[��2
			float3 ttt = pow(saturate(dot(reflect, eyedir)), shininess);
			ttt = smoothstep(_DiffuseThreshold - _DiffuseBlur, _DiffuseThreshold + _DiffuseBlur, ttt);
			// ���ʔ��ˌ�
			specular = ttt * m_specular;
			//�e�����}�C�i�X�ɂȂ�Ȃ��悤�ɕ␳����
			float3 result = atten * (diffuse + specular) * pointLights[i].lightcolor;
			if (result.r < 0.0f) result.r = 0.0f;
			if (result.g < 0.0f) result.g = 0.0f;
			if (result.b < 0.0f) result.b = 0.0f;
			// �S�ĉ��Z����
			shadecolor.rgb += result;
		}
	}

	// �X�|�b�g���C�g
	for (i = 0; i < SPOTLIGHT_NUM; i++) {
		if (spotLights[i].active) {
			// ���C�g�ւ̕����x�N�g��
			lightv = spotLights[i].lightpos - input.worldpos.xyz;
			d = length(lightv);
			lightv = normalize(lightv);

			// ���������W��
			atten = saturate(1.0f / (spotLights[i].lightatten.x + spotLights[i].lightatten.y * d + spotLights[i].lightatten.z * d * d));

			// �p�x����
			cos = dot(lightv, spotLights[i].lightv);
			// �����J�n�p�x����A�����I���p�x�ɂ����Č���
			// �����J�n�p�x�̓�����1�{ �����I���p�x�̊O����0�{�̋P�x
			angleatten = smoothstep(spotLights[i].lightfactoranglecos.y, spotLights[i].lightfactoranglecos.x, cos);
			// �p�x��������Z
			atten *= angleatten;

			// ���C�g�Ɍ������x�N�g���Ɩ@���̓���
			dotlightnormal = dot(lightv, input.normal);
			// ���ˌ��x�N�g��
			reflect = normalize(-lightv + 2 * dotlightnormal * input.normal);
			//�g�D�[��
			dotlightnormal = smoothstep(_DiffuseThreshold - _DiffuseBlur, _DiffuseThreshold + _DiffuseBlur, dotlightnormal);
			// �g�U���ˌ�
			diffuse = dotlightnormal * m_diffuse;
			//�g�D�[��2
			float3 ttt = pow(saturate(dot(reflect, eyedir)), shininess);
			ttt = smoothstep(_DiffuseThreshold - _DiffuseBlur, _DiffuseThreshold + _DiffuseBlur, ttt);
			// ���ʔ��ˌ�
			specular = ttt * m_specular;
			//�e�����}�C�i�X�ɂȂ�Ȃ��悤�ɕ␳����
			float3 result = atten * (diffuse + specular) * spotLights[i].lightcolor;
			if (result.r < 0.0f) result.r = 0.0f;
			if (result.g < 0.0f) result.g = 0.0f;
			if (result.b < 0.0f) result.b = 0.0f;
			// �S�ĉ��Z����
			shadecolor.rgb += atten * (diffuse + specular) * spotLights[i].lightcolor;
		}
	}

	// �ۉe
	for (i = 0; i < CIRCLESHADOW_NUM; i++) {
		if (circleShadows[i].active) {
			// �I�u�W�F�N�g�\�ʂ���L���X�^�[�ւ̃x�N�g��
			casterv = circleShadows[i].casterPos - input.worldpos.xyz;
			// ���������ł̋���
			d = dot(casterv, circleShadows[i].dir);

			// ���������W��
			atten = saturate(1.0f / (circleShadows[i].atten.x + circleShadows[i].atten.y * d + circleShadows[i].atten.z * d * d));
			// �������}�C�i�X�Ȃ�0�ɂ���
			atten *= step(0, d);

			// ���C�g�̍��W
			lightpos = circleShadows[i].casterPos + circleShadows[i].dir * circleShadows[i].distanceCasterLight;
			//  �I�u�W�F�N�g�\�ʂ��烉�C�g�ւ̃x�N�g���i�P�ʃx�N�g���j
			lightv = normalize(lightpos - input.worldpos.xyz);
			// �p�x����
			cos = dot(lightv, circleShadows[i].dir);
			// �����J�n�p�x����A�����I���p�x�ɂ����Č���
			// �����J�n�p�x�̓�����1�{ �����I���p�x�̊O����0�{�̋P�x
			angleatten = smoothstep(circleShadows[i].factorAngleCos.y, circleShadows[i].factorAngleCos.x, cos);
			// �p�x��������Z
			atten *= angleatten;

			// �S�Č��Z����
			shadecolor.rgb -= atten;
		}
	}

	/*if (shadecolor.r > 0.5f) shadecolor.r = 0.8f;
	if (shadecolor.r <= 0.5f) shadecolor.r = 0.5f;
	if (shadecolor.g > 0.5f) shadecolor.g = 0.8f;
	if (shadecolor.g <= 0.5f) shadecolor.g = 0.5f;
	if (shadecolor.b > 0.5f) shadecolor.b = 0.8f;
	if (shadecolor.b <= 0.5f) shadecolor.b = 0.5f;*/
	//smoothstep(circleShadows[i].factorAngleCos.y, circleShadows[i].factorAngleCos.x, cos);

	if (texcolor.a == 0) discard;

	// �V�F�[�f�B���O�ɂ��F�ŕ`��
	return /*shadecolor **/ texcolor;
}