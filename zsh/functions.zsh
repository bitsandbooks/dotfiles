# fpath=($ZSH/)

# Get computer name
box_name() { [ -f $HOME/.box-name ] && cat $HOME/.box-name || hostname -s }

# Create a new directory and enter it
md() { mkdir -p "$@" && cd "$@" }

# Use Git’s colored diff when available
# hash git &>/dev/null
# if [ $? -eq 0 ]; then
# 	function diff() {
# 		git diff --no-index --color-words "$@"
# 	}
# fi

# Create a data URL from an image (works for other file types too, if you 
# tweak the Content-Type afterwards)
function dataurl() {
	echo "data:image/${1##*.};base64,$(openssl base64 -in "$1")" | tr -d '\n'
}

# Test if HTTP compression (RFC 2616 + SDCH) is enabled for a given URL.
# Send a fake UA string for sites that sniff it instead of using the
# Accept-Encoding header. (Looking at you, ajax.googleapis.com!)
function httpcompression() {
	encoding="$(curl -LIs -H 'User-Agent: Mozilla/5 Gecko' -H 'Accept-Encoding: gzip,deflate,compress,sdch' "$1" | grep '^Content-Encoding:')" && echo "$1 is encoded using ${encoding#* }" || echo "$1 is not using any encoding"
}

# Gzip-enabled `curl`
function gurl() { curl -sH "Accept-Encoding: gzip" "$@" | gunzip }

# Syntax-highlight JSON strings or files
function json() {
	if [[ -p /dev/stdin ]]; then
		# piping, e.g. `echo '{"foo":42}' | json`
		python -mjson.tool | pygmentize -l javascript
	else
		# e.g. `json '{"foo":42}'`
		python -mjson.tool <<< "$*" | pygmentize -l javascript
	fi
}

# Escape UTF-8 characters into their 3-byte format
function escape() {
	printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
	echo # newline
}

# Decode \x{ABCD}-style Unicode escape sequences
function unidecode() {
	perl -e "binmode(STDOUT, ':utf8'); print \"$@\""
	echo # newline
}

# Get a character’s Unicode code point
function codepoint() {
	perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))"
	echo # newline
}