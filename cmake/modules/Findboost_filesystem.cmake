# Find boost_filesystem Library (depends on the library being in the project directory, not installed elsewhere)

# Look for header files in the project specific include directory
find_path(BOOST_FILESYSTEM_INCLUDE_DIR boost/filesystem.hpp HINTS ${PROJECT_SOURCE_DIR}/include ${BOOST_FILESYSTEM_BASE}/include ${LIBRARY_BASE}/include)

# Look for library in the project specific library path (We're specifically looking for the static library here)
find_library(BOOST_FILESYSTEM_LIBRARY NAMES libboost_filesystem-vc140-mt-1_65_1 boost_filesystem boost_filesystem-mt HINTS ${PROJECT_SOURCE_DIR}/lib/Win64 ${PROJECT_SOURCE_DIR}/lib/Linux ${PROJECT_SOURCE_DIR}/lib/macOS ${BOOST_FILESYSTEM_BASE}/lib ${LIBRARY_BASE}/lib)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(BOOST_FILESYSTEM DEFAULT_MSG BOOST_FILESYSTEM_LIBRARY BOOST_FILESYSTEM_INCLUDE_DIR)

mark_as_advanced(BOOST_FILESYSTEM_INCLUDE_DIR BOOST_FILESYSTEM_LIBRARY)

set(BOOST_FILESYSTEM_LIBRARIES ${BOOST_FILESYSTEM_LIBRARY})
set(BOOST_FILESYSTEM_INCLUDE_DIRS ${BOOST_FILESYSTEM_INCLUDE_DIR})
