# create variables for the bash commands that
# generate date and time (for the footer line)
DATE = `date +"%Y-%m-%d"` 
TIME = `date +"%H:%M"`
FILENAME := $(shell /bin/date "+%Y%m%d")

# for calling target listing from target deploy
# see: https://stackoverflow.com/questions/5377297/how-to-manually-call-another-target-from-a-make-target/27132934#27132934
THIS_FILE := $(lastword $(MAKEFILE_LIST))

all: post.html

post.html:
	@pandoc -s post.md -o post.html -f markdown -t html-native_divs-native_spans \
		--template=./post.template --variable=date:$(DATE) --variable=time:$(TIME)

view:
	@xdg-open post.html

listing:
	@rm -f ../posts.html
	@./listing.sh

check:
	@tidy -errors -q post.html

deploy: post.html
	@read -p "Enter Post Name:" post; \
	mv post.html ../posts/$(FILENAME)$$post.html
	@$(MAKE) -f $(THIS_FILE) listing
	@$(MAKE) -f $(THIS_FILE) clean
	@xdg-open ../posts.html

clean:
	@rm -f post.html
