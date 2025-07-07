#pragma once

#ifdef USAGI_PLATFORM_WINDOWS
	#ifdef USAGI_BUILD_DLL
		#define USAGI_API __declspec(dllexport)
	#else 
		#define USAGI_API __declspec(dllimport)
	#endif
#else
	#error Usagi Engine only supports Windows! Sorry :(
#endif
