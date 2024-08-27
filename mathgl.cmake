find_package(MathGL2 QUIET)
if (mathgl2_FOUND)
    message(STATUS "Found mathgl: ${mathgl2_SOURCE_DIR}")
else (mathgl2_FOUND)
    include(FetchContent)
    FetchContent_Declare(mgl
            URL http://downloads.sourceforge.net/mathgl/mathgl-8.0.1.tar.gz
            URL_HASH SHA256=ca84bf9480c39ed3112e920c16ce3d8f2898698f62896f3a57714128622a55aa
            DOWNLOAD_EXTRACT_TIMESTAMP OFF
            FIND_PACKAGE_ARGS NAMES MathGL2
            USES_TERMINAL_DOWNLOAD TRUE)
#    FetchContent_MakeAvailable(mgl)
    FetchContent_GetProperties(mgl)
    if(NOT mgl_POPULATED)
        set(enable-lgpl ON CACHE BOOL "Enable LGPL for MathGL2.")
        set(enable-opengl ON CACHE BOOL "Enable OpenGL for MathGL2.")
        set(enable-glut ON CACHE BOOL "Enable GLUT for MathGL2.")
        FetchContent_Populate(mgl)
        message(STATUS "Fetched MathGL2: ${mgl_SOURCE_DIR}")
        add_subdirectory(${mgl_SOURCE_DIR} ${mgl_BINARY_DIR} EXCLUDE_FROM_ALL)
    endif()
endif(mathgl2_FOUND)
