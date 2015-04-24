ifndef SPINN_DIRS
    $(error SPINN_DIRS is not set.  Please define SPINN_DIRS (possibly by running "source setup" in the spinnaker tools folder))
endif

ifndef APP
    $(error APP is not defined.  Please rerun with APP=<app_name>)
endif

ifndef OBJECTS
    OBJECTS = $(BUILD_DIR)$(APP).o
endif

LIBRARIES = -lspin1_api

include $(SPINN_DIRS)/Makefile.common

all: $(APP_OUTPUT_DIR)$(APP).aplx

$(APP).o: $(APP).c $(SPINN_INC_DIR)/spinnaker.h $(SPINN_INC_DIR)/sark.h $(SPINN_INC_DIR)/spin1_api.h
	$(CC) $(CFLAGS) $(APP).c
	
clean:
	$(RM) $(OBJECTS) $(BUILD_DIR)$(APP).elf $(BUILD_DIR)$(APP).txt $(APP_OUTPUT_DIR)$(APP).aplx