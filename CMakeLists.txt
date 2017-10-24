cmake_minimum_required (VERSION 2.6)
project (Julian_Engine)
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/modules" ${CMAKE_MODULE_PATH})

# Find all source files, including any in subdirectories of src/
file(GLOB_RECURSE SOURCES "src/*.cpp")

# Set up unique settings for each platform
if(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
    # Windows settings
	
	# LIBRARY_BASE is the last place our custom .cmake files will look for libraries. This should point to where most libraries are (root of lib/ and include/)
	set(LIBRARY_BASE "C:/Program Files (x86)/Microsoft Visual Studio 14.0/VC")
	# Boost library bases (they're not in the directory listed above)
	set(BOOST_SYSTEM_BASE C:/boost)
	set(BOOST_FILESYSTEM_BASE C:/boost)
	
    # Load packages for libraries we use
    find_package(OpenGL)
    find_package(GLEW)
    find_package(GLFW)
    find_package(lua)
    find_package(boost_system)
    find_package(boost_filesystem)
    set(PROJECT_LIBRARIES ${OPENGL_LIBRARY} ${GLEW_LIBRARY} ${GLFW_LIBRARY} ${LUA_LIBRARY} ${BOOST_SYSTEM_LIBRARY} ${BOOST_FILESYSTEM_LIBRARY})
    set(PROJECT_INCLUDE_DIRS ${OPENGL_INCLUDE_DIR} ${GLEW_INCLUDE_DIR} ${GLFW_INCLUDE_DIR} ${LUA_INCLUDE_DIR} ${BOOST_SYSTEM_INCLUDE_DIR} ${BOOST_FILESYSTEM_INCLUDE_DIR})
endif()
if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    # GNU/Linux settings
    set(CMAKE_CXX_FLAGS_DEBUG "-Wall -g -pthread")
    set(CMAKE_CXX_FLAGS_RELEASE "-Wall -pthread")

    # LIBRARY_BASE is where all our custom find{package}.cmake files will look for the libraries, after all local locations
    set(LIBRARY_BASE /usr)

    # Load packages for libraries we use
    find_package(OpenGL)
    find_package(GLEW)
    find_package(GLFW)
    find_package(lua)
    find_package(boost_system)
    find_package(boost_filesystem)
    set(PROJECT_LIBRARIES ${OPENGL_LIBRARY} ${GLEW_LIBRARY} ${GLFW_LIBRARY} ${LUA_LIBRARY} ${BOOST_SYSTEM_LIBRARY} ${BOOST_FILESYSTEM_LIBRARY})
    set(PROJECT_INCLUDE_DIRS ${OPENGL_INCLUDE_DIR} ${GLEW_INCLUDE_DIR} ${GLFW_INCLUDE_DIR} ${LUA_INCLUDE_DIR} ${BOOST_SYSTEM_INCLUDE_DIR} ${BOOST_FILESYSTEM_INCLUDE_DIR})
endif()
if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    # macOS settings)

    # LIBRARY_BASE is where all our custom find{package}.cmake files will look for the libraries, after all local locations
    set(LIBRARY_BASE /opt/local)
    set(GLFW_BASE /usr/local)

    # Load packages for libraries we use
    find_package(OpenGL)
    find_package(GLFW)
    find_package(lua)
    find_package(boost_system)
    find_package(boost_filesystem)
    set(PROJECT_LIBRARIES ${OPENGL_LIBRARY} ${GLFW_LIBRARY} ${LUA_LIBRARY} ${BOOST_SYSTEM_LIBRARY} ${BOOST_FILESYSTEM_LIBRARY})
    set(PROJECT_INCLUDE_DIRS ${OPENGL_INCLUDE_DIR} ${GLFW_INCLUDE_DIR} ${LUA_INCLUDE_DIR} ${BOOST_SYSTEM_INCLUDE_DIR} ${BOOST_FILESYSTEM_INCLUDE_DIR})
endif()

# Set up include directories for header files
include_directories(${PROJECT_INCLUDE_DIRS})

# Compile sources into the binary
add_executable(${PROJECT_NAME} ${SOURCES})

# Link the binary with all needed libs
target_link_libraries(${PROJECT_NAME} ${LIBRARIES})
