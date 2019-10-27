browser=google-chrome

default: build

build: jbuild jserve

build-debug: jbuild-debug jserve

build-mobile: jbuild jserve-mobile

jbuild:
	jekyll build

jbuild-debug:
	jekyll build --verbose

jserve:
	jekyll serve

jserve-mobile:
	jekyll serve --host 0.0.0.0

#for Ubuntu firewall
jserve-mobile-enable:
	ufw allow 4000

jserve-mobile-disable:
	ufw delete allow 4000

browser:
	$(browser) http://localhost:4000

