# On KDE Plasma desktop
https://flameshot.org/docs/guide/key-bindings/

https://snapcraft.io/flameshot

To make configuration easier, there's a file in the repository that more or less automates this process. This file will assign the following keys to the following actions by default:

<hr>

Keys	Description

```Prt Sc```	Start the Flameshot screenshot tool and take a screenshot

```Ctrl + Prt Sc```	Wait for 3 seconds, then start the Flameshot screenshot tool and take a screenshot

```Shift + Prt Sc```	Take a full-screen (all monitors) screenshot and save it

```Ctrl + Shift + Prt Sc```	Take a full-screen (all monitors) screenshot and copy it to the clipboard

<hr>

If you don't like the defaults, you can change them manually later.

Steps for using the configuration:

- The configuration file configures shortcuts so that Flameshot automatically saves (without opening the save dialog) screenshots to ~/Pictures/Screenshots folder. Make sure you have that folder by running the following command:
```sh
    mkdir --parents ~/Pictures/Screenshots
```

(If you don't like the default location, you can skip this step and configure your preferred directory later.)

- Download the configuration file:
```sh
    cd ~/Desktop

    wget https://raw.githubusercontent.com/flameshot-org/flameshot/master/docs/shortcuts-config/flameshot-shortcuts-kde.khotkeys
```

- Go to System Settings → Shortcuts → Custom Shortcuts.

- If there's one, you'll need to disable an entry for Spectacle, the default KDE screenshot utility first because its shortcuts might collide with Flameshot's ones; so, just uncheck the Spectacle entry.

- Click Edit → Import..., navigate to the Desktop folder (or wherever you saved the configuration file) and open the configuration file.

- Now the Flameshot entry should appear in the list. Click Apply to apply the changes.

- If you want to change the defaults, you can expand the entry, select the appropriate action and modify it as you wish; the process is pretty mush self-explanatory.

