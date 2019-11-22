set(_url "https://github.com/InsightSoftwareConsortium/ITK/releases/download/v5.0.1/InsightToolkit-5.0.1.tar.gz")
set(_hash "f36613ff72c513ded3d32504f71308a94fe75555cf9fd22b77485d1375601f6e1f1539cc5ac82a9e1e229bcf514a88ccb55122a7dfc74a6ae1b6604aa70bd814")
set(_build "${CMAKE_CURRENT_BINARY_DIR}/itk")

unset(_deps)

ExternalProject_Add(itk
  URL ${_url}
  URL_HASH SHA512=${_hash}
  BINARY_DIR ${_build}
  INSTALL_COMMAND ""
  CMAKE_CACHE_ARGS
    ${TomvizSuper_DEFAULT_ARGS}
    -DITK_LEGACY_REMOVE:BOOL=ON
    -DITK_LEGACY_SILENT:BOOL=ON
    -DModule_ITKBridgeNumPy:BOOL=ON
    -DBUILD_TESTING:BOOL=OFF
    -DITK_WRAP_unsigned_short:BOOL=ON
    -DITK_WRAP_rgb_unsigned_char:BOOL=OFF
    -DITK_WRAP_rgba_unsigned_char:BOOL=OFF
    -DITK_BUILD_DEFAULT_MODULES:BOOL=OFF
    -DITKGroup_Core:BOOL=ON
    -DITKGroup_Filtering:BOOL=ON
    -DITKGroup_Segmentation:BOOL=ON
    -DITKGroup_Nonunit:BOOL=ON
    -DPython_ADDITIONAL_VERSIONS:STRING=3
    -DITK_WRAP_PYTHON:BOOL=ON
    -DBUILD_EXAMPLES:BOOL=OFF
  DEPENDS
    ${_deps}
    )
