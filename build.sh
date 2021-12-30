[ $# -ne 1 ] && echo Usage: $0 [filename] && exit 1
pandoc -s $1.md -c style.css --template template.html --toc --toc-depth=2 -o docs/$1.html

