
OBJDIR := obj
OUTDIR := out
SAMPLES := $(wildcard sample*.asm)
OUTS = $(addprefix $(OUTDIR)/, $(basename $(SAMPLES)))
OBJS = $(addprefix $(OBJDIR)/, $(patsubst %.asm, %.o, $(SAMPLES)))

all: $(OUTS)

test:
	echo hello, @=$@
	echo $(SAMPLES)
	echo $(OUTS)
	echo $(OBJS)

$(OUTDIR)/sample01 : $(OBJDIR)/sample01.o
	ld -o $@ -lSystem $^

$(OBJDIR)/sample01.o : sample01.asm
	nasm -fmacho64 $^ -o $@

$(OUTDIR)/sample02 : $(OBJDIR)/sample02.o
	ld -o $@ -lSystem $^

$(OBJDIR)/sample02.o : sample02.asm
	nasm -fmacho64 $^ -o $@

$(OBJS) : | $(OBJDIR)
$(OUTS): | $(OUTDIR)

$(OUTDIR):
	mkdir $(OUTDIR)

$(OBJDIR):
	mkdir $(OBJDIR)

clean:
	rm -fr $(OBJDIR) $(OUTDIR)

.PHONY: all clean
