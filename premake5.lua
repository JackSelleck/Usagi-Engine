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
IncludeDir["Glad"] = "Usagi/vendor/Glad/include"

include "Usagi/vendor/GLFW"
include "Usagi/vendor/Glad"
	
-------- USAGI --------

project "Usagi"
	location "Usagi"
	kind "SharedLib"
	language "C++"
	staticruntime "On"

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
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}"
	}

	links
	{
		"GLFW",
		"Glad",
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
		"USAGI_BUILD_DLL",
		"GLFW_INCLUDE_NONE"
	}

	postbuildcommands
	{
		("{COPYFILE} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
	}

	filter "configurations:Debug"
		defines "USAGI_DEBUG"
		buildoptions "/MDd"
		symbols "On"

	filter "configurations:Release"
		defines "USAGI_RELEASE"
		buildoptions "/MD"
		optimize "On"

	filter "configurations:Dist"
		defines "USAGI_DIST"
		buildoptions "/MD"
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
		buildoptions "/MDd"
		symbols "On"

	filter "configurations:Release"
		defines "USAGI_RELEASE"
		buildoptions "/MD"
		optimize "On"

	filter "configurations:Dist"
		defines "USAGI_DIST"
		buildoptions "/MD"
		optimize "On"
