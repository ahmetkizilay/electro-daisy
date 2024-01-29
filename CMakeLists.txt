cmake_minimum_required(VERSION 3.25)

# to avoid errors initial linker errors.
set(CMAKE_C_COMPILER_WORKS ON)
set(CMAKE_CXX_COMPILER_WORKS ON)

set(LIBDAISY_PATH ${CMAKE_SOURCE_DIR}/libDaisy)
set(DAISYDSP_PATH ${CMAKE_SOURCE_DIR}/DaisySP)
include(daisy_util.cmake)

project(daisy_blink C CXX ASM)
set(CMAKE_C_STANDARD 23)
set(CMAKE_CXX_STANDARD 23)

add_subdirectory(blink)