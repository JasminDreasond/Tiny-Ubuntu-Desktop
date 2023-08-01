https://askubuntu.com/questions/1255707/apt-cant-find-packages-on-ubuntu-20-04-arm64-raspberry-pi-4

Yes, this is an ancient question, but the "got it to work" answer isn't correct.
```sh
sudo nano /etc/apt/sources.list
```
append these to the bottom of the file
```sh
deb [arch=arm64] http://ports.ubuntu.com/ focal main multiverse universe

deb [arch=arm64] http://ports.ubuntu.com/ focal-security main multiverse universe

deb [arch=arm64] http://ports.ubuntu.com/ focal-backports main multiverse universe

deb [arch=arm64] http://ports.ubuntu.com/ focal-updates main multiverse universe
```

Exit and save.
```sh
sudo dpkg --print-foreign-architectures

sudo dpkg --add-architecture arm64

sudo dpkg --print-foreign-architectures
```
You should now see arm64 in your list of foreign architectures
```sh
sudo apt-get update
```
You should see quite a few arm64 entries listed. There will be a few "404 not found" as repos move around. The problem is that many of the development packages for arm64 (notably libx11-dev) are in "ports"
