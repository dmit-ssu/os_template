cmake_minimum_required (VERSION 2.6)
project (TEMPLATE)

if(CMAKE_COMPILER_IS_GNUCC)
  message(STATUS "=== GCC C COMPILER DETECTED ===")
  set(CMAKE_C_FLAGS "-std=gnu99 -O2 -Wall -Werror -ggdb")
endif(CMAKE_COMPILER_IS_GNUCC)

if(WIN32)
  message(STATUS "=== MSVC COMPILER DETECTED ===")
endif(WIN32)

add_executable (main main.c)
