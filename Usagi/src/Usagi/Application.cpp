#include "UsagiPch.h"
#include "Application.h"

#include "Usagi/Events/ApplicationEvent.h"
#include "Usagi/Log.h"

namespace Usagi {

	Application::Application()
	{

	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		if (e.IsInCategory(EventCategoryApplication))
		{
			USAGI_TRACE(e.ToString());
		}
		if (e.IsInCategory(EventCategoryInput))
		{
			USAGI_TRACE(e.ToString());
		}
			
		while (true);
	}

}