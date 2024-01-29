macro(daisy_make TARGET)
string(REPLACE "<TARGET_NAME>" ${TARGET} mkfile_str "

TARGET = <TARGET_NAME>

# Sources
CPP_SOURCES = *.cpp

SYSTEM_FILES_DIR = $(LIBDAISY_DIR)/core
include $(SYSTEM_FILES_DIR)/Makefile
")
    file(GENERATE 
      OUTPUT ./build/Makefile
      CONTENT ${mkfile_str})

add_custom_target(${TARGET}_make
  COMMAND LIBDAISY_DIR=${LIBDAISY_PATH} DAISYSP_DIR=${DAISYDSP_PATH} make -f ./build/Makefile
)
add_custom_target(${TARGET}_flash
  COMMAND LIBDAISY_DIR=${LIBDAISY_PATH} DAISYSP_DIR=${DAISYDSP_PATH} make -f ./build/Makefile program-dfu
  DEPENDS ${TARGET}_make
)
endmacro()