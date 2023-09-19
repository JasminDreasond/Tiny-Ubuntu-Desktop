# ERROR: ENOSPC: SYSTEM LIMIT FOR NUMBER OF FILE WATCHERS REACHED
https://www.vivaolinux.com.br/dica/Error-ENOSPC-System-limit-for-number-of-file-watchers-reached-Resolvido

This error often happens to Node.js developers, usually when running the "npm start" command. In my case, it happened when running a React Native project in debug mode on the "react-native start" command.

## PROBLEM
When starting a watcher, we receive the error:

    Error: ENOSPC: System limit for number of file watchers reached

## SOLUTION
Increase the user watch limit on the operating system.

### Check current limit:

    cat /proc/sys/fs/inotify/max_user_watches
    8192

### Adjust the new limit in the /etc/sysctl.conf file:

    echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

The above command added the line "fs.inotify.max_user_watches=524288" to the /etc/sysctl.conf file and then asked the kernel to reload the new settings.

### Check the new limit:

    cat /proc/sys/fs/inotify/max_user_watches
    524288

Problem solved!