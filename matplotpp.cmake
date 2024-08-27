# Uses `gnuplot` process to render data plots
# Assumes that `gnuplot` is installed in accessible on PATH
find_package(Matplot++ QUIET)
if(Matplot++_FOUND)
    message(STATUS "Found Matplot++: ${Matplot++_SOURCE_DIR}")
else(Matplot++_FOUND)
    include(FetchContent)
    FetchContent_Declare(matplotpp
        GIT_REPOSITORY https://github.com/alandefreitas/matplotplusplus
        GIT_TAG master
        GIT_SHALLOW TRUE  # download specific revision only (git clone --depth 1)
        GIT_PROGRESS TRUE # show download progress in Ninja
        FIND_PACKAGE_ARGS NAMES Matplot++
        USES_TERMINAL_DOWNLOAD TRUE)
    FetchContent_GetProperties(matplotpp)
    if(NOT matplotpp_POPULATED)
        set(MATPLOTPP_BUILD_EXAMPLES OFF CACHE BOOL "Enable matplot++ examples.")
        set(MATPLOTPP_BUILD_TESTS OFF CACHE BOOL "Enable matplot++ tests.")
        FetchContent_Populate(matplotpp)
        message(STATUS "Fetched Matplot++: ${matplotpp_SOURCE_DIR}")
        add_subdirectory(${matplotpp_SOURCE_DIR} ${matplotpp_BINARY_DIR} EXCLUDE_FROM_ALL)
    endif()
endif(Matplot++_FOUND)
