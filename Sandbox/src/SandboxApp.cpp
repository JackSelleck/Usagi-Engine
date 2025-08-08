#include <Usagi.h>

class ExampleLayer : public Usagi::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{
	}

	void OnUpdate() override
	{
		if (Usagi::Input::IsKeyPressed(USAGI_KEY_TAB))
		{
			USAGI_TRACE("Tab key is pressed!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		}
	}

	void OnEvent(Usagi::Event& event) override
	{
		//Usagi mouse Position
		//USAGI_TRACE("{0}", event.ToString());

		if (event.GetEventType() == Usagi::EventType::KeyPressed)
		{
			Usagi::KeyPressedEvent& e = (Usagi::KeyPressedEvent&)event;
			USAGI_TRACE("{0}", (char)e.GetKeyCode());
		}
	}

};

class Sandbox : public Usagi::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
		PushOverlay(new Usagi::ImGuiLayer());
	}

	~Sandbox()
	{

	}
};

Usagi::Application* Usagi::CreateApplication()
{
	return new Sandbox();
}