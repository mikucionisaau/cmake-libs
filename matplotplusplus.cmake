# Ensures Matplot++ (C++ API to gnuplot) is installed
# Assumes that `gnuplot` is installed in accessible on PATH
include(FetchContent)

find_program(GNUPLOT_PROGRAM NAMES gnuplot REQUIRED)

if (GNUPLOT_PROGRAM)
    message(STATUS "Found gnuplot: ${GNUPLOT_PROGRAM}")
else (GNUPLOT_PROGRAM)
    message(FATAL "Failed to find gnuplot, please install and add it to PATH environment variable")
endif (GNUPLOT_PROGRAM)

FetchContent_Declare(matplotplusplus
    GIT_REPOSITORY https://github.com/alandefreitas/matplotplusplus
    GIT_TAG master
    GIT_SHALLOW TRUE  # download specific revision only (git clone --depth 1)
    GIT_PROGRESS TRUE # show download progress in Ninja
    EXCLUDE_FROM_ALL ON
    FIND_PACKAGE_ARGS 1.2.2)

set(MATPLOTPP_BUILD_EXAMPLES OFF CACHE BOOL "Enable Matplot++ examples.")
set(MATPLOTPP_BUILD_TESTS OFF CACHE BOOL "Enable Matplot++ tests.")

FetchContent_MakeAvailable(matplotplusplus)

if(matplotplusplus_FOUND)
    message(STATUS "Found matplotplusplus: ${matplotplusplus_DIR}")
else(matplotplusplus_FOUND)
    message(STATUS "Fetched matplotplusplus: ${matplotplusplus_SOURCE_DIR}")
    #add_subdirectory(${matplotpp_SOURCE_DIR} ${matplotpp_BINARY_DIR} EXCLUDE_FROM_ALL)
endif(matplotplusplus_FOUND)
