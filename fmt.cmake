# Downloads and compiles formatting library fmt
include(FetchContent)
#set(FETCHCONTENT_QUIET ON)
#set(FETCHCONTENT_UPDATES_DISCONNECTED ON)

FetchContent_Declare(fmt
        GIT_REPOSITORY https://github.com/fmtlib/fmt.git
        GIT_TAG 12.1.0   # "master" for latest
        GIT_SHALLOW TRUE  # download specific revision only (git clone --depth 1)
        GIT_PROGRESS TRUE # show download progress in Ninja
        EXCLUDE_FROM_ALL ON # don't build if not used
        FIND_PACKAGE_ARGS 12.1.0)

set(FMT_PEDANTIC OFF CACHE BOOL "Enable extra warnings and expensive tests.")
set(FMT_WERROR OFF CACHE BOOL "Halt the compilation with an error on compiler warnings.")

# Options that control generation of various targets.
set(FMT_DOC OFF CACHE BOOL "Generate the doc target.")
set(FMT_INSTALL OFF CACHE BOOL "Generate the install target.")
set(FMT_TEST OFF CACHE BOOL "Generate the test target.")
set(FMT_FUZZ OFF CACHE BOOL "Generate the fuzz target.")
set(FMT_CUDA_TEST OFF CACHE BOOL "Generate the cuda-test target.")
set(FMT_OS ON CACHE BOOL "Include OS-specific APIs.")
set(FMT_MODULE OFF CACHE BOOL "Build a module instead of a traditional library.")
set(FMT_SYSTEM_HEADERS OFF CACHE BOOL "Expose headers with marking them as system.")
set(FMT_UNICODE ON CACHE BOOL "Enable Unicode support.")

FetchContent_MakeAvailable(fmt)

if(fmt_FOUND) # find_package
    message(STATUS "Found fmt: ${fmt_DIR}")
else(fmt_FOUND) # FetchContent
    message(STATUS "Fetched fmt: ${fmt_SOURCE_DIR}")
endif(fmt_FOUND)

if (TARGET fmt::fmt)
    message(STATUS "    Available target: fmt::fmt")
endif ()

