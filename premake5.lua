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

project "Usagi"
	location "Usagi"
	kind "sharedLib"
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
		"%{prj.name}/vendor/spdlog/include"
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
		"USAGI_PLATFORM_WINDOWS",
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
