CC=gcc
EXFILE = executable

SRC = $(wildcard *.c)
OBJ = $(SRC:.c=.o)
DEP = $(SRC:.c=.d)

$(EXFILE): $(OBJ)
	@$(CC) -o $@ $^

%.o : %.c
	@$(CC) -c -o $@ $<

%.d : %.c
	@$(CC) -MM -o $@ $<

clean:
	@rm -f *.d *.o

-include $(DEP)

