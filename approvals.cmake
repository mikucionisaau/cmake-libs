# Approval testing framework
FetchContent_Declare(ApprovalTests
        GIT_REPOSITORY https://github.com/approvals/ApprovalTests.cpp.git
        GIT_TAG v.10.13.0  # "master" for latest
        GIT_SHALLOW TRUE  # download specific revision only (git clone --depth 1)
        GIT_PROGRESS TRUE # show download progress in Ninja
        EXCLUDE_FROM_ALL ON # don't build if not used
        FIND_PACKAGE_ARGS 10.13.0)

set(APPROVAL_TESTS_BUILD_TESTING OFF CACHE BOOL "Build self-tests.")
set(APPROVAL_TESTS_BUILD_EXAMPLES OFF CACHE BOOL "Build documentation examples.")
set(APPROVAL_TESTS_BUILD_DOCS OFF CACHE BOOL "Build documentation - if Doxygen and Sphinx are found.")

set(APPROVAL_TESTS_BUILD_THIRD_PARTY_CATCH2 OFF CACHE BOOL "Include this project's copy of the Catch2v2 test framework")
set(APPROVAL_TESTS_BUILD_THIRD_PARTY_DOCTEST OFF CACHE BOOL "Include this project's copy of the doctest test framework")
set(APPROVAL_TESTS_BUILD_THIRD_PARTY_UT OFF CACHE BOOL "Include this project's copy of the Boost.UT test framework")

set(APPROVAL_TESTS_ENABLE_CODE_COVERAGE OFF CACHE BOOL "Enable coverage reporting for selected tests")
set(APPROVAL_TESTS_ENABLE_BOOST_TEST_INTEGRATION OFF CACHE BOOL "Enable the Boost.Test integration and testing")
set(APPROVAL_TESTS_ENABLE_CATCH2_INTEGRATION OFF CACHE BOOL "Enable the Catch2 integration and testing")
set(APPROVAL_TESTS_ENABLE_CATCH2V3_INTEGRATION OFF CACHE BOOL "Enable the Catch2v3 integration and testing")
set(APPROVAL_TESTS_ENABLE_CPPUTEST_INTEGRATION OFF CACHE BOOL "Enable the CppUTest integration and testing")
set(APPROVAL_TESTS_ENABLE_DOCTEST_INTEGRATION OFF CACHE BOOL "Enable the doctest integration and testing")
set(APPROVAL_TESTS_ENABLE_GOOGLETEST_INTEGRATION OFF CACHE BOOL "Enable the GoogleTest integration and testing")
set(APPROVAL_TESTS_ENABLE_UT_INTEGRATION OFF CACHE BOOL "Enable the Boost.UT integration and testing")

FetchContent_MakeAvailable(ApprovalTests)

if(ApprovalTests_FOUND) # find_package
    message(STATUS "Found ApprovalTests: ${ApprovalTests_DIR}")
else(ApprovalTests_FOUND) # FetchContent
    message(STATUS "Fetched ApprovalTests: ${ApprovalTests_SOURCE_DIR}")
endif(ApprovalTests_FOUND)

if (TARGET ApprovalTests::ApprovalTests)
    message(STATUS "    Available target: ApprovalTests::ApprovalTests")
endif ()
