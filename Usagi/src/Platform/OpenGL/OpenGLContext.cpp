#include "UsagiPch.h"
#include "OpenGLContext.h"

#include <GLFW/glfw3.h>
#include <glad/glad.h>

namespace Usagi
{
	OpenGLContext::OpenGLContext(GLFWwindow* windowHandle)
		: m_WindowHandle(windowHandle)
	{
		USAGI_CORE_ASSERT(windowHandle, "Window handle is null!")
	}
	void OpenGLContext::Init()
	{
		glfwMakeContextCurrent(m_WindowHandle);
		int status = gladLoadGLLoader((GLADloadproc)glfwGetProcAddress);
		USAGI_CORE_ASSERT(status, "Failed to initialize Glad!");

		USAGI_CORE_INFO("OpenGL Info:");
		USAGI_CORE_INFO("  Vendor: {0}", (const char*)glGetString(GL_VENDOR));
		USAGI_CORE_INFO("  Renderer: {0}", (const char*)glGetString(GL_RENDERER));
		USAGI_CORE_INFO("  OPENGL Version: {0}", (const char*)glGetString(GL_VERSION));
		/*GLint n = 0;
		glGetIntegerv(GL_NUM_EXTENSIONS, &n);
		for (GLint i = 0; i < n; i++) {
			printf("%s\n", glGetStringi(GL_EXTENSIONS, i));
		}*/
	}
	void OpenGLContext::SwapBuffers()
	{
		glfwSwapBuffers(m_WindowHandle);
	}
}
