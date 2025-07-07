#pragma once

#include "Core.h"

namespace Usagi
{
	class USAGI_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// To be defined in CLIENT
	Application* CreateApplication();

}


