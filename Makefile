SRCDIR   = src
OBJDIR   = obj
BINDIR   = bin

.PHONY: clean

all: exit

exit.o:
	as $(SRCDIR)/exit.s -o $(OBJDIR)/exit.o

exit: exit.o
	ld $(OBJDIR)/exit.o -o $(BINDIR)/exit

clean:
	rm -rf $(OBJDIR)/* $(BINDIR)/*
