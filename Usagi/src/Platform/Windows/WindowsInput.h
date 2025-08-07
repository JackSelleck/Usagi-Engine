#pragma once

#include "Usagi/Input.h"

namespace Usagi {

	class WindowsInput : public Input
	{
	protected:
		// key press
		virtual bool IsKeyPressedImpl(int keycode) override;

		// mouse button
		virtual bool IsMouseButtonPressedImpl(int button) override;

		// mouse position
		virtual std::pair<float, float> GetMousePositionImpl() override;
		// mouse x/y separate positions
		virtual float GetMouseXImpl() override;
		virtual float GetMouseYImpl() override;
	};
}
