#include "K01Ball.h"
#include "PrimitiveFunc.h"
#include "ColorFuncs.h"
#include "DrawStrings.h"
#include "FPS.h"
#include "Input.h"

void K01Ball::Init()
{
	BallPos = XMFLOAT2(0, WINDOW_HEIGHT);
	v0t.x = 25;
	v0t.y = 200;
	time = 0.0f;
	TimerFrame = 0;
	gravity = 9.8f;
	angle = 30.0f;
	rad = Smath::radian(angle);
}

void K01Ball::Update()
{
	TimerFrame += 3;
	time = (float)TimerFrame / (float)FPS::Maxfps;

	// ŽÎ•û“ŠŽË
	// xŽ² : “™‘¬’¼ü‰^“®
	BallPos.x = v0t.x * cos(rad) * time;
	// Ž©—R—Ž‰º
	BallPos.y = v0t.y * sin(rad) * time - 0.5f * gravity * time * time;
	BallPos.y = WINDOW_HEIGHT - BallPos.y;
	Reset();
}

void K01Ball::Draw()
{
	//DrawBox(XMFLOAT2(0, 0), XMFLOAT2(WINDOW_WIDTH, WINDOW_HEIGHT), ColorConvert(XMFLOAT4(30, 30, 30, 255)));
	DrawBox(XMFLOAT2(0, WINDOW_HEIGHT - 32), XMFLOAT2(WINDOW_WIDTH, WINDOW_HEIGHT), ColorConvert(XMFLOAT4(255, 255, 255, 255)));
	DrawBox(XMFLOAT2(BallPos.x - 10, BallPos.y - 10), XMFLOAT2(BallPos.x + 10, BallPos.y + 10), ColorConvert(XMFLOAT4(255, 0, 0, 255)));
	//DrawCube(XMFLOAT3(100, -5, 100), XMFLOAT3(0, 0, 0), ColorConvert(XMFLOAT4(255, 255, 255, 255))); // °
	//DrawIcosahedron(BallPos, 10, XMFLOAT4(1, 0, 0, 1), true); // ‹Ê
	DrawStrings::Instance()->DrawFormatString(XMFLOAT2(0, 0), 32, XMFLOAT4(1, 1, 1, 1), "posX : %f", BallPos.x);
	DrawStrings::Instance()->DrawFormatString(XMFLOAT2(0, 32), 32, XMFLOAT4(1, 1, 1, 1), "posY : %f", BallPos.y);
}

void K01Ball::Reset()
{
	if (Input::isKeyTrigger(DIK_R)) {
		Init();
	}
}
