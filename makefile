browser=google-chrome

default: build

#https://kbroman.org/simple_site/pages/local_test.html
build:
	jekyll build
	jekyll serve

browser:
	$(browser) http://localhost:4000

