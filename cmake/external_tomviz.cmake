set(_source "${CMAKE_CURRENT_SOURCE_DIR}/tomviz")
set(_build "${CMAKE_CURRENT_BINARY_DIR}/tomviz")

unset(_deps)

ExternalProject_Add(tomviz
  SOURCE_DIR ${_source}
  BINARY_DIR ${_build}
  CMAKE_CACHE_ARGS
    ${TomvizSuper_DEFAULT_ARGS}
    -DParaView_DIR:PATH=${CMAKE_CURRENT_BINARY_DIR}/paraview
  DEPENDS
    paraview
    ${_deps}
)
