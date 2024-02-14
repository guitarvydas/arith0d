LIBSRC=0D/odin/std
ODIN_FLAGS ?= -debug -o:none
D2J=0d/das2json/das2json

dev: clean run

run: arith0d transpile.drawio.json
	./arith0d ex1.math main arith0d.drawio $(LIBSRC)/transpile.drawio

arith0d: arith0d.drawio.json
	odin build . $(ODIN_FLAGS)

arith0d.drawio.json: arith0d.drawio transpile.drawio.json
	$(D2J) arith0d.drawio

transpile.drawio.json: $(LIBSRC)/transpile.drawio
	$(D2J) $(LIBSRC)/transpile.drawio

clean:
	rm -rf arith0d arith0d.dSYM *~ *.json
