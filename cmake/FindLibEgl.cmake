find_path(LIBEGL_INCLUDE_DIRS NAMES EGL/egl.h)
find_library(EGL_LIBRARY EGL)
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibEgl DEFAULT_MSG EGL_LIBRARY LIBEGL_INCLUDE_DIRS)
mark_as_advanced(LIBEGL_INCLUDE_DIRS EGL_LIBRARY)
if(LIBEGL_FOUND)
    message(STATUS "libEgl found with ${LIBEGL_INCLUDE_DIRS} - ${EGL_LIBRARY}")
    add_library(LIBEGL::LIBEGL UNKNOWN IMPORTED)
    set_target_properties(LIBEGL::LIBEGL PROPERTIES
      IMPORTED_LOCATION "${EGL_LIBRARY}"
      INTERFACE_INCLUDE_DIRECTORIES "${LIBEGL_INCLUDE_DIRS}")
endif()
