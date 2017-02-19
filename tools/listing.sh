#!/bin/bash
# Based on
# https://stackoverflow.com/questions/21395159/shell-script-to-create-a-static-html-directory-listing
# https://stackoverflow.com/questions/125281/how-do-i-remove-the-file-suffix-and-path-portion-from-a-path-string-in-bash
# https://serverfault.com/questions/72476/clean-way-to-write-complex-multi-line-string-to-a-variable


ROOT="../posts"
OUTPUT="../posts.html"
PREFIX=$(cat <<EOF
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Frag's Writings</title>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
</head>
<body>
<h3>Posts</h3>
<div> Rants, articles and other <span style="font-style:italic;">gyaan</span>.</div>
<div>
EOF
)

SUFFIX=$(cat <<EOF
</div>
<div style="text-align:center"><h5><a href="index.html">Home</a>&nbsp;|&nbsp;<a href="about.html">About</a></h5></div>
</body>
</html>
EOF
)

echo "${PREFIX}" > $OUTPUT

i=0
echo "<ul>" >> $OUTPUT
for i in $(find $ROOT -maxdepth 1 -mindepth 1 -type f | sort); do
    file=$(basename "$i")
    newname=$(basename "$file" .html)                                           # strip html extension
    timecode=$(echo "$newname" | sed 's/[A-Za-z]*//g')                          # strip leading date
    newname=$(echo "$newname" | sed 's/^[0-9]*//g')                             # strip leading date
    newname="$(tr '[:lower:]' '[:upper:]' <<< ${newname:0:1})${newname:1}"      # capitalize first word
    echo "    <li><a href=\"posts/$file\">$timecode :: $newname</a></li>" >> $OUTPUT
  done
echo "</ul>" >> $OUTPUT

echo "${SUFFIX}" >> $OUTPUT
