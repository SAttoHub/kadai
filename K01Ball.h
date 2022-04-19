#pragma once
#include "Smath.h"

class K01Ball
{
private:
	using XMFLOAT2 = DirectX::XMFLOAT2;
	using XMFLOAT3 = DirectX::XMFLOAT3;
	using XMFLOAT4 = DirectX::XMFLOAT4;

private:
	XMFLOAT2 BallPos; // �����l
	float Range; 

	XMFLOAT2 v0t; // ����
	float gravity;
	float time;
	int TimerFrame;

	float angle;
	float rad;
public:
	void Init();
	void Update();
	void Draw();
	void Reset();
};

