browser=google-chrome

default: build

#https://kbroman.org/simple_site/pages/local_test.html
build:
	jekyll build
	jekyll serve

build-debug:
	jekyll build --verbose
	jekyll serve

browser:
	$(browser) http://localhost:4000

