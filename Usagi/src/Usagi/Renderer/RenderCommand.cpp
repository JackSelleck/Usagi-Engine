#include "UsagiPch.h"
#include "RenderCommand.h"

#include "Platform/OpenGL/OpenGLRendererAPI.h"

namespace Usagi
{
	RendererAPI* RenderCommand::s_RendererAPI = new OpenGLRendererAPI;
}