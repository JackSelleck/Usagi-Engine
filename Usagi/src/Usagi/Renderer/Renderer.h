#pragma once
namespace Usagi
{
	enum class RendererAPI
	{
		None = 0, OpenGL = 1
	};

	class Renderer
	{
	public:
		inline static RendererAPI GetAPI() { return s_RendererAPI; }
	public:
		static RendererAPI s_RendererAPI;
	};
}
