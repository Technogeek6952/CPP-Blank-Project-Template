# Find boost_system Library (depends on the library being in the project directory, not installed elsewhere)

# Look for header files in the project specific include directory
find_path(BOOST_SYSTEM_INCLUDE_DIR boost/system/config.hpp HINTS ${PROJECT_SOURCE_DIR}/include ${BOOST_SYSTEM_BASE}/include ${LIBRARY_BASE}/include)

# Look for library in the project specific library path (We're specifically looking for the static library here)
find_library(BOOST_SYSTEM_LIBRARY NAMES libboost_system-vc140-mt-1_65_1 boost_system boost_system-mt HINTS ${PROJECT_SOURCE_DIR}/lib/Win64 ${PROJECT_SOURCE_DIR}/lib/Linux ${PROJECT_SOURCE_DIR}/lib/macOS ${BOOST_SYSTEM_BASE}/lib ${LIBRARY_BASE}/lib)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(BOOST_SYSTEM DEFAULT_MSG BOOST_SYSTEM_LIBRARY BOOST_SYSTEM_INCLUDE_DIR)

mark_as_advanced(BOOST_SYSTEM_INCLUDE_DIR BOOST_SYSTEM_LIBRARY)

set(BOOST_SYSTEM_LIBRARIES ${BOOST_SYSTEM_LIBRARY})
set(BOOST_SYSTEM_INCLUDE_DIRS ${BOOST_SYSTEM_INCLUDE_DIR})
