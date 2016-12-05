SRCDIR   = src
OBJDIR   = obj
BINDIR   = bin

MKDIR = mkdir -p

all: dirs exit maximum

$(OBJDIR)/:
	$(MKDIR) $(OBJDIR)/

$(BINDIR)/:
	$(MKDIR) $(BINDIR)/

.PHONY: dirs
dirs: $(OBJDIR)/ $(BINDIR)/

$(OBJDIR)/exit.o: $(SRCDIR)/exit.s
	as $(SRCDIR)/exit.s -o $(OBJDIR)/exit.o

$(BINDIR)/exit: $(OBJDIR)/exit.o
	ld $(OBJDIR)/exit.o -o $(BINDIR)/exit

.PHONY: exit
exit: $(BINDIR)/exit

$(OBJDIR)/maximum.o: $(SRCDIR)/maximum.s
	as $(SRCDIR)/maximum.s -o $(OBJDIR)/maximum.o

$(BINDIR)/maximum: $(OBJDIR)/maximum.o
	ld $(OBJDIR)/maximum.o -o $(BINDIR)/maximum

.PHONY: maximum
maximum: $(BINDIR)/maximum

.PHONY: clean
clean:
	rm -rf $(OBJDIR)/
	rm -rf $(BINDIR)/
