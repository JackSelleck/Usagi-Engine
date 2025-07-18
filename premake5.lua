workspace "Usagi"
	architecture "x64"
	startproject "Sandbox"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Usagi/vendor/GLFW/include"

include "Usagi/vendor/GLFW"
	
-------- USAGI --------

project "Usagi"
	location "Usagi"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "UsagiPch.h"
	pchsource "Usagi/src/UsagiPch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}"
	}

	links
	{
		"GLFW",
		"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		buildoptions { "/utf-8" }

	defines
	{
		"USAGI_PLATFORM_WINDOWS",
		"USAGI_BUILD_DLL"
	}

	postbuildcommands
	{
		("{COPYFILE} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
	}

	filter "configurations:Debug"
		defines "USAGI_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "USAGI_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "USAGI_DIST"
		optimize "On"

-------- SANDBOX --------

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Usagi/vendor/spdlog/include",
		"Usagi/src"
	}

	links
	{
		"Usagi"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		buildoptions { "/utf-8" }

	defines
	{
		"USAGI_PLATFORM_WINDOWS"
	}

	filter "configurations:Debug"
		defines "USAGI_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "USAGI_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "USAGI_DIST"
		optimize "On"
