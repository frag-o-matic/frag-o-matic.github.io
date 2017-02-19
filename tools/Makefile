# create variables for the bash commands that
# generate date and time (for the footer line)
DATE = `date +"%Y-%m-%d"` 
TIME = `date +"%H:%M"`
FILENAME := $(shell /bin/date "+%Y%m%d")

all:
	pandoc -s post.md -o post.html -f markdown -t html-native_divs-native_spans \
		--template=./post.template --variable=date:$(DATE) --variable=time:$(TIME)
	xdg-open post.html

check:
	tidy -errors -q post.html

deploy:
	mv post.html ../posts/$(FILENAME).html

clean:
	rm -f post.html
