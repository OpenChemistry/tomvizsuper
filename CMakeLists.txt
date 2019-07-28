cmake_minimum_required(VERSION 3.3)
project(TomvizSuper CXX)

set(CMAKE_MODULE_PATH
  "${CMAKE_CURRENT_SOURCE_DIR}/cmake"
  ${CMAKE_MODULE_PATH})

include(BuildType)
include(BuildLocation)

include(ExternalProject)

option(BUILD_SHARED_LIBS "Build libraries as SHARED" ON)
set(TomvizSuper_INSTALL_PREFIX "${TomvizSuper_BINARY_DIR}/prefix")
set(TomvizSuper_DEFAULT_ARGS
  "-DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}"
  "-DCMAKE_PREFIX_PATH:PATH=${TomvizSuper_INSTALL_PREFIX};${CMAKE_PREFIX_PATH}"
  "-DCMAKE_INSTALL_PREFIX:PATH=${TomvizSuper_INSTALL_PREFIX}"
  "-DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}")

find_package(Qt5 COMPONENTS Widgets REQUIRED)
list(APPEND TomvizSuper_DEFAULT_ARGS "-DQt5_DIR:PATH=${Qt5_DIR}")

include(external_paraview)
include(external_tomviz)
