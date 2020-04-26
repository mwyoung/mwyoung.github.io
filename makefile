browser=google-chrome

default: build

build: jbuild jserve

build-browser: jbuild browser jserve

build-debug: jbuild-debug jserve

build-mobile: jbuild jserve-mobile

jbuild:
	jekyll build

jbuild-debug:
	jekyll build --verbose

jserve:
	jekyll serve

jserve-mobile:
	@echo "=============="
	hostname -I
	@echo "=============="
	jekyll serve --host 0.0.0.0

#for ufw firewall - needs sudo
firewall-allow:
	ufw allow 4000

firewall-disallow:
	ufw delete allow 4000

firewall-status:
	ufw status

browser:
	$(browser) http://localhost:4000

