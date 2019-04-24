find_path(LIBGBM_INCLUDE_DIRS NAMES gbm.h)
find_library(GBM_LIBRARY gbm)
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibGbm DEFAULT_MSG GBM_LIBRARY LIBGBM_INCLUDE_DIRS)
mark_as_advanced(LIBGBM_INCLUDE_DIRS GBM_LIBRARY)
if(LIBGBM_FOUND)
    message(STATUS "libGbm found with ${LIBGBM_INCLUDE_DIRS} - ${GBM_LIBRARY}")
    add_library(LIBGBM::LIBGBM UNKNOWN IMPORTED)
    set_target_properties(LIBGBM::LIBGBM PROPERTIES
      IMPORTED_LOCATION "${GBM_LIBRARY}"
      INTERFACE_INCLUDE_DIRECTORIES "${LIBGBM_INCLUDE_DIRS}")
endif()
