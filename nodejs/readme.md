# Install
### https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04

To install a different version of Node.js, you can use a PPA (personal package archive) maintained by NodeSource. These PPAs have more versions of Node.js available than the official Ubuntu repositories. Node.js v16 and v18 are available as of the time of writing.

First, install the PPA to get access to its packages. From your home directory, use curl to retrieve the installation script for your preferred version, making sure to replace 16.x with your preferred version string (if different):

```bash
cd ~
curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
```

Refer to the NodeSource documentation for more information on the available versions.

Inspect the contents of the downloaded script with nano or your preferred text editor:

```bash
nano /tmp/nodesource_setup.sh
```

When you are satisfied that the script is safe to run, exit your editor. Then run the script with sudo:

```bash
sudo bash /tmp/nodesource_setup.sh
```

The PPA will be added to your configuration and your local package cache will be updated automatically. You can now install the Node.js package in the same way you did in the previous section:

```bash
sudo apt install nodejs
```

Verify that you’ve installed the new version by running node with the -v version flag:

```bash
node -v
```

```
Output
v16.19.0
```

The NodeSource nodejs package contains both the node binary and npm, so you don’t need to install npm separately.

At this point, you have successfully installed Node.js and npm using apt and the NodeSource PPA.

<hr/>

# Modules

```bash
npm install -g node-gyp

npm install -g firebase-tools

npm install -g pm2

pm2 startup
```