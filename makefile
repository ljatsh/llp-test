
OBJDIR := obj
OUTDIR := out

all: $(OUTDIR)/sample01

test:
	echo hello

$(OUTDIR)/sample01 : $(OBJDIR)/sample01.o
	ld -o $(OUTDIR)/sample01 -lSystem $(OBJDIR)/sample01.o

$(OBJDIR)/sample01.o : sample01.asm
	nasm -fmacho64 sample01.asm -o $(OBJDIR)/sample01.o

$(OBJDIR)/sample01.o : | $(OBJDIR)
$(OUTDIR)/sample01: | $(OUTDIR)

$(OUTDIR):
	mkdir $(OUTDIR)

$(OBJDIR):
	mkdir $(OBJDIR)

clean:
	rm -fr $(OBJDIR) $(OUTDIR)

.PHONY: clean
