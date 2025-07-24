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
		//USAGI_INFO("ExampleLayer::Update");
	}

	void OnEvent(Usagi::Event& event) override
	{
		USAGI_TRACE("{0}", event.ToString());
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