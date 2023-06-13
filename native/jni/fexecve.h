#include <sys/syscall.h>
#include <linux/fcntl.h>
#include <errno.h>

int xfexecve(int fd, char *const argv[], char *const envp[]) {
    if (fd < 0 || argv == NULL || envp == NULL) {
      errno = EINVAL;
      return -1;
    }
    int ret = syscall(SYS_execveat, fd, "", argv, envp, AT_EMPTY_PATH);
    if (errno == ENOSYS) {
        char buf[128];
        snprintf(buf, sizeof(buf)-1, "/proc/self/fd/%d", fd);
        return syscall(SYS_execve, buf, argv, envp);
    }
    return ret;
}
