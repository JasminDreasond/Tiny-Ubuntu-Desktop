# https://blog.geekhunter.com.br/update-node-js-tutorial-facil-rapido/

Node Package Manager, or NPM, can help you discover, share, and use code, along with dependencies. And best of all, Node JS comes with NPM pre-installed, however, it is updated more frequently than Node.

To check your current version, just run `npm -v` in the terminal. Next, run `npm install npm@latest –g` to install the latest version (if you are not already using it) and `npm –v` again to make sure the update was successful.

After this step, it will be time to finally carry out the dreamed Node JS update. And to do this, you will need to install an NPM module called `n`.

Therefore, to clear the NPM cache, install module `n` and install the latest version of Node JS, run the following lines of code in your terminal:
```sh
sudo npm cache clean -f

sudo npm install -g n

sudo n stable
```

To install the latest version, whether stable or not, run `sudo n latest`. Another alternative is to run `n #.#.#`, to update Node JS to a specific version.