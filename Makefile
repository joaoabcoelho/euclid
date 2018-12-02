
CC = g++-5
#CFLAGS = -g -Wall -pedantic
#CFLAGS = -O3 -std=c++11
CFLAGS = -std=c++11

HDRS = $(wildcard src/*.h)
SRCS = $(patsubst %.h, %.cxx, $(HDRS))

EXECLIST = test
EXECS = $(patsubst %, bin/%, $(EXECLIST))

OBJS = $(patsubst src/%.cxx, tmp/%.o, $(SRCS))
#OBJS += $(patsubst bin/%, tmp/%.o, $(EXECS))

all: $(EXECS)

$(EXECS): bin/%: $(OBJS) tmp/%.o
	@echo "Making executable..."
	@mkdir -p bin
	@$(CC) $(CFLAGS) -o $@ $^

tmp/%.o: src/%.cxx $(HDRS)
	@echo "Compiling $<"
	@mkdir -p tmp
	@$(CC) $(CFLAGS) -c $< -o $@

.PHONY:clean

clean:
	-rm -fr tmp bin
