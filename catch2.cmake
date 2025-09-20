# Ensures Catch2 (unit testing framework) is installed
include(FetchContent)
#set(FETCHCONTENT_QUIET ON)
#set(FETCHCONTENT_UPDATES_DISCONNECTED ON)

FetchContent_Declare(Catch2
    GIT_REPOSITORY https://github.com/catchorg/Catch2.git
    GIT_TAG v3.10.0   # "devel" for latest
    GIT_SHALLOW TRUE  # download specific revision only (git clone --depth 1)
    GIT_PROGRESS TRUE # show download progress in Ninja
    EXCLUDE_FROM_ALL ON # don't build if not used
    FIND_PACKAGE_ARGS 3.10)
set(CATCH_INSTALL_DOCS OFF CACHE BOOL  "Install documentation alongside library")
set(CATCH_INSTALL_EXTRAS ON CACHE BOOL "Install extras (CMake scripts, debugger helpers) alongside library")
set(CATCH_DEVELOPMENT_BUILD OFF CACHE BOOL "Build tests, enable warnings, enable Werror, etc")
set(CATCH_ENABLE_REPRODUCIBLE_BUILD ON CACHE BOOL  "Add compiler flags for improving build reproducibility")

set(CATCH_BUILD_TESTING OFF CACHE BOOL "Build the SelfTest project")
set(CATCH_BUILD_EXAMPLES OFF CACHE BOOL "Build code examples")
set(CATCH_BUILD_EXTRA_TESTS OFF CACHE BOOL "Build extra tests")
set(CATCH_BUILD_FUZZERS OFF CACHE BOOL "Build fuzzers")
set(CATCH_ENABLE_COVERAGE OFF CACHE BOOL "Generate coverage for codecov.io")
set(CATCH_ENABLE_WERROR OFF CACHE BOOL "Enables Werror during build")
set(CATCH_BUILD_SURROGATES OFF CACHE BOOL "Enable generating and building surrogate TUs for the main headers")
set(CATCH_ENABLE_CONFIGURE_TESTS OFF CACHE BOOL "Enable CMake configuration tests. WARNING: VERY EXPENSIVE")
set(CATCH_ENABLE_CMAKE_HELPER_TESTS OFF CACHE BOOL "Enable CMake helper tests. WARNING: VERY EXPENSIVE")

FetchContent_MakeAvailable(Catch2)

if(Catch2_FOUND) # find_package
    message(STATUS "Found Catch2: ${Catch2_DIR}")
else(Catch2_FOUND) # FetchContent
    message(STATUS "Fetched Catch2: ${Catch2_SOURCE_DIR}")
endif(Catch2_FOUND)
