#pragma once

#include "Core.h"

#include "Window.h"
#include "Usagi/LayerStack.h"
#include "Usagi/Events/Event.h"
#include "Usagi/Events/ApplicationEvent.h"

namespace Usagi
{
	class USAGI_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		void OnEvent(Event& e);

		void PushLayer(Layer* layer);
		void PushOverlay(Layer* layer);

	private:
		
		// for closing application
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		bool m_Running = true;

		// layerstack inherits lifetime of application
		LayerStack m_LayerStack;
	};

	// To be defined in CLIENT
	Application* CreateApplication();

}


