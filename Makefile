SRCDIR   = src
OBJDIR   = obj
BINDIR   = bin

MKOBJDIR = mkdir -p $(OBJDIR)/
MKBINDIR = mkdir -p $(BINDIR)/

all: $(BINDIR)/exit

$(OBJDIR)/exit.o: $(SRCDIR)/exit.s
	$(MKOBJDIR)
	as $(SRCDIR)/exit.s -o $(OBJDIR)/exit.o

$(BINDIR)/exit: $(OBJDIR)/exit.o
	$(MKBINDIR)
	ld $(OBJDIR)/exit.o -o $(BINDIR)/exit

.PHONY: clean
clean:
	rm -rf $(OBJDIR)/
	rm -rf $(BINDIR)/
