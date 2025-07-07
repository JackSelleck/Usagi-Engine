#include <Usagi.h>

class Sandbox : public Usagi::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}
};

Usagi::Application* Usagi::CreateApplication()
{
	return new Sandbox();
}