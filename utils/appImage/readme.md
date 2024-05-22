### https://www.reddit.com/r/debian/comments/hkyeft/unable_to_run_appimage_applications_without/

AppImages based on Electron require the kernel to be configured in a certain way to allow for its sandboxing to work as intended (specifically, the kernel needs to be allowed to provide “unprivileged namespaces”). Many distributions come with this configured out of the box (like Ubuntu for instance), but some do not (for example Debian).

To temporarily enable unprivileged namespaces, you can run this command:

```sh
sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0
``` 

This command will take effect immediately but will not survive a reboot. To permanently enable unprivileged namespaces, run:

```sh
echo kernel.apparmor_restrict_unprivileged_userns=0 | sudo tee /etc/sysctl.d/local.conf
```

This command will take effect only on the next reboot.

Please see https://docs.appimage.org/user-guide/troubleshooting.html#i-have-issues-with-electron-based-appimages-and-their-sandboxing for more information.

If you think that Debian should enable unprivileged namespaces by default (like most other desktop distributions do), then please file an issue with Debian.
