#pragma once

// Checks the users operating system

#ifdef USAGI_PLATFORM_WINDOWS
	#ifdef USAGI_BUILD_DLL
		#define USAGI_API __declspec(dllexport)
	#else 
		#define USAGI_API __declspec(dllimport)
	#endif
#else
	#error Usagi Engine only supports Windows! Sorry :(
#endif

#ifdef USAGI_ENABLE_ASSERTS
	#define USAGI_ASSERT(x, ...) { if(!(x)) { USAGI_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); }}
	#define USAGI_CORE_ASSERT(x, ...) { if(!x)) { USAGI_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); }}
#else
	#define USAGI_ASSERT(x, ...)
	#define USAGI_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)