# Find GLFW Library (depends on the library being in the project directory, not installed elsewhere)
# GLFW depends on OpenGL, so make sure that's loaded
find_package(OpenGL)

# Look for header files in the project specific include directory
find_path(GLFW_INCLUDE_DIR NAMES GLFW/glfw3.h HINTS ${PROJECT_SOURCE_DIR}/include ${OPENGL_INCLUDE_DIR} ${GLFW_BASE}/include ${LIBRARY_BASE}/include)

# Look for library in the project specific library path (We're specifically looking for the static library here)
find_library(GLFW_LIBRARY NAMES glfw3 glfw HINTS ${PROJECT_SOURCE_DIR}/lib/Win64 ${PROJECT_SOURCE_DIR}/lib/Linux ${PROJECT_SOURCE_DIR}/lib/macOS ${GLFW_BASE}/lib ${LIBRARY_BASE}/lib)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GLFW DEFAULT_MSG GLFW_LIBRARY GLFW_INCLUDE_DIR)

mark_as_advanced(GLFW_INCLUDE_DIR GLFW_LIBRARY)

set(GLFW_LIBRARIES ${GLFW_LIBRARY})
set(GLFW_INCLUDE_DIRS ${GLFW_INCLUDE_DIR})
