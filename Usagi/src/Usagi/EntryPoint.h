#pragma once

#ifdef USAGI_PLATFORM_WINDOWS

extern Usagi::Application* Usagi::CreateApplication();

int main(int argc, char** arg)
{
	printf("Boarding The Great Usagi Engine!!! choooo choooo \n");

	auto app = Usagi::CreateApplication();
	app->Run();
	delete app;
}

#endif