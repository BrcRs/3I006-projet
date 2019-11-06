CC = gcc
COMPILE = $(CC) -fPIC -g3 -c
LINK = $(CC) -o $@
CFLAGS = -Werror

BINDIR := bin
SRCDIR := src

PROGRAMS = TacheA test_tools

SRCS := src/*.c

OBJS = $(SRCS:.c=.o)

all: check $(PROGRAMS)
	-mv *.o $(BINDIR)

check :
	-cd $(BINDIR) ; mv -t .. *.o

# Compilation

%.o : $(SRCDIR)/%.c
	$(CC) -c $< $(CFLAGS) -o $@


# Edition des liens
TacheA: TacheA.o adnFiles.o
	$(LINK) TacheA.o adnFiles.o

test_tools: test_tools.o tools.o
	$(LINK) test_tools.o tools.o

#testMini6: testMini6.o graph.o viaMinimization.o generatePostScript.o $(OBJSA)
#	$(LINK) testMini6.o viaMinimization.o graph.o generatePostScript.o $(OBJSA)


clean:

	-rm -f *.o $(PROGRAMS)
	-cd src ; rm -f *.o
	-cd $(BINDIR) ; rm -f *.o

.PHONY: clean all check