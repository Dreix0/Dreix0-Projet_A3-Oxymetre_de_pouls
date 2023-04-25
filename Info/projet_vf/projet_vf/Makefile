EXEC=exe

SRC_DIR = .
BUILD_DIR = ./build

SRC= $(shell find $(SRC_DIR) -name '*.c')
OBJ= $(SRC:%=$(BUILD_DIR)/%.o)
LDFLAGS=-lm
CFLAGS=-Wall -Wextra -std=c89 -g

all: $(EXEC)

$(EXEC): $(OBJ)
		$(CC) $(OBJ) -o $@ $(LDFLAGS)

$(BUILD_DIR)/%.c.o: %.c
		$(MKDIR_P) $(dir $@)
		$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean

clean:
		@rm -rf $(BUILD_DIR)
		@rm -rf $(EXEC)

rebuild:
		@make clean
		@make

MKDIR_P ?= @mkdir -p