# CMake Scripts for Libraries

This repository contains CMake scripts for fetching and compiling various libraries on-demand.
The repository is kept lightweight to be integrated into other projects by adding it as a **git submodule**.

The scripts are tested by examples in [CMake Library Tests](https://github.com/mikucionisaau/cmake-libs-test) repository.

Execute the following in your project root directory to add `cmake-libs` directory to your project:
```shell
git submodule add git@github.com:mikucionisaau/cmake-libs.git
```

Then in your `CMakeLists.txt` file add one or several of the following commands:
```cmake
include(cmake-libs/sanitizers.cmake) # Compiler options to enable sanitizers
include(cmake-libs/doctest.cmake)  # Fetches doctest unit testing framework
include(cmake-libs/benchmark.cmake) # Fetches Google Benchmark framework
```
Visit [CMake Library Tests](https://github.com/mikucionisaau/cmake-libs-test) to see features and simple use cases.

The following libraries are supported:
- [sanitizers](sanitizers.cmake) compiler sanitizer options.
- [doctest](doctest.cmake): [doctest unit testing](https://github.com/doctest/doctest) framework.
- [benchmark](benchmark.cmake): [Google Micro-Benchmarking](https://github.com/google/benchmark) framework.
- [matplot++](matplotpp.cmake): [Matplot++](https://github.com/alandefreitas/matplotplusplus) A C++ Graphics Library for Data Visualization.

## Dependent Projects

The dependent projects should be cloned together with submodules:
```
git clone --recurse-submodules $PROJECT_URL
```

If you forget `--recurse-submodules` then submodules can be fetched later from within the working directory using:
```
git submodule update --init --remote --recursive
```

Afterwards the submodules can be updated using:
```
git submodule update --recursive
```
