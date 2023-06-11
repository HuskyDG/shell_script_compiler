# Note, $0 will be /proc/self/fd/<number> after compiling
# Use $ORIGINAL_PATH to refer to execute binary path

WELCOME="Hello. You have executed $ORIGINAL_PATH or $0"
echo $WELCOME
echo $WELCOME | base64

