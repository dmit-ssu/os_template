cmake_minimum_required (VERSION 2.6)
project (TEMPLATE)

set(CMAKE_C_FLAGS "-std=gnu99 -O2 -Wall -Werror -ggdb")

add_executable (test main.c)
