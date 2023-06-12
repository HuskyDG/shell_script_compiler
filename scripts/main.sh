# Note, $0 will be /proc/self/fd/<number> after compiling
# Use $ORIGINAL_PATH to refer to execute binary path

WELCOME="Hello. You have executed $ORIGINAL_PATH"
echo $WELCOME
echo "BUSYBOX_PATH=$BUSYBOX_PATH"
echo "SCRIPT_PATH=$SCRIPT_PATH"
echo $WELCOME | base64

