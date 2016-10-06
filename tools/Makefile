all:
	pandoc -s post.md -o post.html --template=./post.template --variable=date:$(date +"%Y-%m-%d") --variable=time:$(date +"%H:%M")
	xdg-open post.html
	
clean:
	rm -f post.html
