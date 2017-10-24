# Find GLEW Library
# GLEW depends on OpenGL, so make sure that's loaded
find_package(OpenGL)

# Look for header files in the project specific include directory
find_path(GLEW_INCLUDE_DIR GL/glew.h HINTS ${PROJECT_SOURCE_DIR}/include ${OPENGL_INCLUDE_DIR} ${GLEW_BASE}/include ${LIBRARY_BASE}/include)
message("${LIBRARY_BASE}/lib")
# Look for library in the project specific library path (We're specifically looking for the static library here)
find_library(GLEW_LIBRARY NAMES glew32s GLEW HINTS ${PROJECT_SOURCE_DIR}/lib/Win64 ${PROJECT_SOURCE_DIR}/lib/Linux ${PROJECT_SOURCE_DIR}/lib/macOS ${GLEW_BASE}/lib ${LIBRARY_BASE}/lib)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GLEW DEFAULT_MSG GLEW_LIBRARY GLEW_INCLUDE_DIR)

mark_as_advanced(GLEW_INCLUDE_DIR GLEW_LIBRARY)

set(GLEW_LIBRARIES ${GLEW_LIBRARY})
set(GLEW_INCLUDE_DIRS ${GLEW_INCLUDE_DIR})
