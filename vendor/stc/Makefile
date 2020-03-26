SRC=$(wildcard *.java)
OBJ=$(patsubst %.java, %, $(SRC))
CLASS=$(patsubst %.java, %.class, $(SRC))
CC=javac
IC=java

compile:
	@$(CC) $(SRC) > compilation.out

clean:
	rm $(CLASS)

public_t:
	@set -e ; \
	for input in public/inputs/*.in; do \
		output=$$(echo "$$input" | sed -re 's/\.in$$/.out/' | sed -re 's/inputs/outputs/') ; \
		res=$$(echo "$$input" | sed -re 's/\.in$$/.res/' | sed -re 's/inputs/res/') ; \
		diff=$$(echo "$$input" | sed -re 's/\.in$$/.diff/' | sed -re 's/inputs/diffs/') ; \
		mkdir -p "public/res" ;\
		mkdir -p "public/diffs" ;\
		echo ; \
		echo "Test on $$input: " ; \
		$(IC) $(SRC) < "$$input" > "$$res" ;\
		if diff "$$res" "$$output" > "$$diff" ;  then \
			echo "OK" ; \
		else \
			echo "***********************************"; \
			echo "Failed on $$input" ; \
			echo "***********************************"; \
		fi ; \
	done
	zip -r public.zip public/res public/diffs ;\


private_t:
	@set -e ; \
	for input in private/inputs/*.in; do \
		output=$$(echo "$$input" | sed -re 's/\.in$$/.out/' | sed -re 's/inputs/outputs/') ; \
		res=$$(echo "$$input" | sed -re 's/\.in$$/.res/' | sed -re 's/inputs/res/') ; \
		diff=$$(echo "$$input" | sed -re 's/\.in$$/.diff/' | sed -re 's/inputs/diffs/') ; \
		mkdir -p "private/res" ;\
		mkdir -p "private/diffs" ;\
		echo ; \
		echo "Test on $$input: " ; \
		$(IC) $(SRC) < "$$input" > "$$res" ;\
		if diff "$$res" "$$output" > "$$diff" ;  then \
			echo "OK" ; \
		else \
			echo "***********************************"; \
			echo "Failed on $$input" ; \
			echo "***********************************"; \
		fi ; \
	done
	zip -r private.zip private/res private/diff ;\



private_test: compile private_t clean
public_test: compile public_t clean


all_test: compile public_t private_t
