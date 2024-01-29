cmake_minimum_required(VERSION 3.25)

# to avoid errors initial linker errors.
set(CMAKE_C_COMPILER_WORKS ON)
set(CMAKE_CXX_COMPILER_WORKS ON)

set(LIBDAISY_PATH ${CMAKE_SOURCE_DIR}/libDaisy)
set(DAISYDSP_PATH ${CMAKE_SOURCE_DIR}/DaisySP)

project(daisy_blink C CXX ASM)
set(CMAKE_C_STANDARD 23)
set(CMAKE_CXX_STANDARD 23)

macro(daisy_make TARGET)
    file(GENERATE 
      OUTPUT ./build/Makefile
      CONTENT "

TARGET = blink

# Sources
CPP_SOURCES = blink.cpp

SYSTEM_FILES_DIR = $(LIBDAISY_DIR)/core
include $(SYSTEM_FILES_DIR)/Makefile
")

add_custom_target(${TARGET}_make
  COMMAND LIBDAISY_DIR=${LIBDAISY_PATH} DAISYSP_DIR=${DAISYDSP_PATH} make -f ./build/Makefile
)
add_custom_target(${TARGET}_flash
  COMMAND make -f ./build/Makefile program-dfu
  DEPENDS ${TARGET}_make
)
endmacro()

add_subdirectory(blink)