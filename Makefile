.PHONY: lint html epub build

lint:
	npm run lint

html:
	./scripts/build-html.sh

epub:
	./scripts/build-epub.sh

build: lint html
