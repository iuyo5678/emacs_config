all: output

clean:
	rm -rf output

init:
	for i in shell bin conf share; do mkdir -p output/$$i; done

output: init
(>>>POINT<<<)

.PHONY: init clean output
