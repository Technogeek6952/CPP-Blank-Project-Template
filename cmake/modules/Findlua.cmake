# Find Lua C Library (depends on the library being in the project directory, not installed elsewhere)

# Look for header files in the project specific include directory
find_path(LUA_INCLUDE_DIR lua/lua.h HINTS ${PROJECT_SOURCE_DIR}/include ${LUA_BASE}/include ${LIBRARY_BASE}/include)

# Look for library in the project specific library path (We're specifically looking for the static library here)
find_library(LUA_LIBRARY NAMES lua53 lua HINTS ${PROJECT_SOURCE_DIR}/lib/Win64 ${PROJECT_SOURCE_DIR}/lib/Linux ${PROJECT_SOURCE_DIR}/lib/macOS ${LUA_BASE}/lib ${LIBRARY_BASE}/include)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LUA DEFAULT_MSG LUA_LIBRARY LUA_INCLUDE_DIR)

mark_as_advanced(LUA_INCLUDE_DIR LUA_LIBRARY)

set(LUA_LIBRARIES ${LUA_LIBRARY})
set(LUA_INCLUDE_DIRS ${LUA_INCLUDE_DIR})
