project(kmscube)
cmake_minimum_required(VERSION 3.10)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
find_package(LibGbm REQUIRED)
find_package(LibDrm REQUIRED)
find_package(LibM REQUIRED)
find_package(LibEgl REQUIRED)
find_package(LibGles REQUIRED)


SET(CMAKE_DEBUG_POSTFIX _g)
SET(KMSCUBE_SOURCES common.c 
                    cube-smooth.c 
                    cube-tex.c 
                    drm-atomic.c 
                    drm-common.c 
                    drm-legacy.c 
                    esTransform.c 
                    esUtil.h 
                    frame-512x512-NV12.c 
                    frame-512x512-RGBA.c 
                    kmscube.c)

add_executable(${PROJECT_NAME} ${KMSCUBE_SOURCES})                    
target_include_directories(${PROJECT_NAME} PRIVATE ./)
target_link_libraries(${PROJECT_NAME} LIBGBM::LIBGBM LIBDRM::LIBDRM LIBM::LIBM LIBEGL::LIBEGL LIBGLES::LIBGLES)

include(GNUInstallDirs)
install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})