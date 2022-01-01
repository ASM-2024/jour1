CC = gcc
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99

TARGET = prog
TEST = test-suite

MAIN = src/prog.o
OBJ = $(patsubst %.c, %.o, $(wildcard src/*/*.c))
TEST_OBJ = $(patsubst %.c, %.o, $(wildcard tests/*))

HEADERS = $(wildcard src/*/*.h)
INC_FLAGS = $(addprefix -I, $(dir $(wildcard src/*/)))

CFLAGS += $(INC_FLAGS)

all: release

release: CFLAGS += -O2 -DNDBUG
release: $(TARGET)

debug: CFLAGS += -g -fsanitize=address
debug: LDFLAGS += -fsanitize=address
debug: $(TARGET)

test: CFLAGS += -g -fsanitize=address
test: LDFLAGS += -fsanitize=address -lcriterion
test: $(TEST)
	./$(TEST)

$(TARGET): $(MAIN) $(OBJ)
	$(LINK.o) $^ $(LOADLIBES) $(LDLIBS) -o $@

$(TEST): $(OBJ) $(TEST_OBJ)
	$(LINK.o) $^ $(LOADLIBES) $(LDLIBS) -o $@

# https://www.gnu.org/software/make/manual/make.html#Static-Pattern
$(OBJ) $(TEST_OBJ): %.o: %.c $(HEADERS)

.PHONY: clean

clean:
	$(RM) $(TARGET)
	$(RM) $(TEST)
	$(RM) $(MAIN)
	$(RM) $(OBJ)
	$(RM) $(TEST_OBJ)
