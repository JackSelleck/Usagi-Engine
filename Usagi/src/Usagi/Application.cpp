#include "UsagiPch.h"
#include "Application.h"

#include "Usagi/Events/ApplicationEvent.h"
#include "Usagi/Log.h"

#include <GLFW/glfw3.h>

namespace Usagi {

	Application::Application()
	{
		m_Window = std::unique_ptr<Window>(Window::Create());
	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		while (m_Running)
		{			
			m_Window->OnUpdate();
		}
	}

}