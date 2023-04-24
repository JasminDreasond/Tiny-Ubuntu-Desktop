# Controlling the Global User Directory
The user directory is where Dolphin stores saves, settings, screenshots, and other data. Where the user directory is located depends on the Dolphin version, operating system, and your configuration. Some locations let the user directory be shared by different installations of Dolphin (a global user directory), and some locations are tied to a specific installation of Dolphin (a local user directory).

By default, Dolphin uses a global user directory and follows the XDG Base Directory Specification for determining its location. If the directory ~/.dolphin-emu exists, or you are using a version of Dolphin older than 4.0-8143, ~/.dolphin-emu will be used as the location of the global user directory instead.

## Disable the Global User Directory for a Specific Build with "portable.txt"
In Dolphin 5.0-148 and later, it's possible to use the same portable.txt method as on Windows to set a local user directory for a Dolphin build.

To make a build use a local user directory, create a file named portable.txt in the same directory as the executable files of the build. Dolphin will check if that file exists in the same directory, then it will not use the global user directory, instead it will create and use the local user directory in the same directory.

## Custom Command Line Path
If you are launching Dolphin from the command line, you can set a custom user directory path for the current session of Dolphin by using the -u option:
```
/path/to/dolphin/build/dolphin-emu -u /path/to/user/directory
```

Dolphin will use the regular user directory path again the next time you launch Dolphin, unless you use -u again.

## Environment Variable
If you set the DOLPHIN_EMU_USERPATH environment variable, Dolphin will use its value as the path to the user directory.