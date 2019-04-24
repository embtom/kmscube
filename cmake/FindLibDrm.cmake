find_path(LIBDRM_INCLUDE_DIRS NAMES drm_fourcc.h PATH_SUFFIXES "libdrm")
find_library(DRM_LIBRARY drm)
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibDrm DEFAULT_MSG DRM_LIBRARY LIBDRM_INCLUDE_DIRS)
mark_as_advanced(LIBDRM_INCLUDE_DIRS DRM_LIBRARY)
if(LIBDRM_FOUND)
    message(STATUS "libDrm found with ${LIBDRM_INCLUDE_DIRS} - ${DRM_LIBRARY}")
    add_library(LIBDRM::LIBDRM UNKNOWN IMPORTED)
    set_target_properties(LIBDRM::LIBDRM PROPERTIES
      IMPORTED_LOCATION "${DRM_LIBRARY}"
      INTERFACE_INCLUDE_DIRECTORIES "${LIBDRM_INCLUDE_DIRS}")
endif()