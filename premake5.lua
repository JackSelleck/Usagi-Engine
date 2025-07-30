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
IncludeDir["ImGui"] = "Usagi/vendor/ImGui"

include "Usagi/vendor/GLFW"
include "Usagi/vendor/Glad"
include "Usagi/vendor/ImGui"
	
-------- USAGI --------

project "Usagi"
	location "Usagi"
	kind "SharedLib"
	language "C++"
	staticruntime "off"

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
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}"
	}

	links
	{
		"GLFW",
		"Glad",
		"ImGui",
		"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
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
		("{COPY} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/Sandbox/\"")
	}

	filter "configurations:Debug"
		defines "USAGI_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "USAGI_RELEASE"
		runtime "Release"
		optimize "On"

	filter "configurations:Dist"
		defines "USAGI_DIST"
		runtime "Release"
		optimize "On"


-------- SANDBOX --------

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	staticruntime "off"


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
		systemversion "latest"
		buildoptions { "/utf-8" }

	defines
	{
		"USAGI_PLATFORM_WINDOWS"
	}

	filter "configurations:Debug"
		defines "USAGI_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "USAGI_RELEASE"
		runtime "Release"
		optimize "On"

	filter "configurations:Dist"
		defines "USAGI_DIST"
		runtime "Release"
		optimize "On"