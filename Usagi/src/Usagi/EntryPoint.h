#include "UsagiPch.h"

#pragma once

#ifdef USAGI_PLATFORM_WINDOWS

extern Usagi::Application* Usagi::CreateApplication();

int main(int argc, char** arg)
{
	// Welcome Message
	printf("Boarding The Great Usagi Engine!!! choooo choooo \n");

	// Initialise Log
	Usagi::Log::Init();
	USAGI_CORE_WARN("Initialised Core Log!");
	USAGI_INFO("Initialised Client Log!");

	// Run Application
	auto app = Usagi::CreateApplication();
	app->Run();
	delete app;
}

#endif