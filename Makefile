SRCDIR   = src
OBJDIR   = obj
BINDIR   = bin

.PHONY: dirs clean

all: dirs exit

dirs:
	mkdir -p $(OBJDIR) $(BINDIR)

exit.o:
	as $(SRCDIR)/exit.s -o $(OBJDIR)/exit.o

exit: dirs exit.o
	ld $(OBJDIR)/exit.o -o $(BINDIR)/exit

clean:
	rm -rf $(OBJDIR)/* $(BINDIR)/*
