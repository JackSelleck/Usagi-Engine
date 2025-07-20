#pragma once

#include "Core.h"
#include "Events/Event.h"
#include "Usagi/Events/ApplicationEvent.h"

#include "Window.h"

namespace Usagi
{
	class USAGI_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		void OnEvent(Event& e);

	private:
		
		// for closing application
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
	};

	// To be defined in CLIENT
	Application* CreateApplication();

}


