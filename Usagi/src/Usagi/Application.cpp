#include "UsagiPch.h"
#include "Application.h"

#include "Usagi/Log.h"

#include <GLFW/glfw3.h>

namespace Usagi {

#define BIND_EVENT_FN(x) std::bind(&Application::x, this, std::placeholders::_1));

	Application::Application()
	{
		m_Window = std::unique_ptr<Window>(Window::Create());
		m_Window->SetEventCallback(BIND_EVENT_FN(OnEvent);
	}

	Application::~Application()
	{

	}

	void Application::OnEvent(Event& e)
	{
		EventDispatcher dispatcher(e);
		dispatcher.Dispatch<WindowCloseEvent>(BIND_EVENT_FN(OnWindowClose);

		USAGI_CORE_TRACE("{0}", e.ToString());
	}

	void Application::Run()
	{
		while (m_Running)
		{			
			m_Window->OnUpdate();
		}
	}

	bool Application::OnWindowClose(WindowCloseEvent& e)
	{
		m_Running = false;
		return true;
	}

}