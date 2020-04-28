
OBJDIR := obj
OUTDIR := out
SAMPLES := $(wildcard sample*.asm)
OUTS = $(addprefix $(OUTDIR)/, $(basename $(SAMPLES)))
OBJS = $(addprefix $(OBJDIR)/, $(patsubst %.asm, %.o, $(SAMPLES)))

NASM := nasm
NFLAGS := -fmacho64

$(OBJDIR)/%.o : %.asm
	$(NASM) $(NFLAGS) -o $@ $<

$(OUTDIR)/% : $(OBJDIR)/%.o
	ld -o $@ -lSystem $<

all: $(OUTS)

test:
	echo hello

$(OBJS) : | $(OBJDIR)
$(OUTS): | $(OUTDIR)

$(OUTDIR):
	mkdir $(OUTDIR)

$(OBJDIR):
	mkdir $(OBJDIR)

clean:
	rm -fr $(OBJDIR) $(OUTDIR)

.PHONY: all clean
