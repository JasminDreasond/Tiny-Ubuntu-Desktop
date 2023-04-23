# How to switch between Python 3 versions
https://dev.to/alfchee/how-to-switch-between-python-3-versions-5gh6

I'm new in the Python world, and the big change I know it happened this year 2020 (in the Python world, because in the real world many many odd things happened), is that Python 2.7 versions are deprecated and Python 3.x versions are now the mandatory.

But, in this I'm seeing that there's an apparent fragmentation, in which still is the use of `3.6.x` but also you may use frameworks or libraries that are currently using `3.7.x` or `3.8.x` and those versions have implemented features not yet supported in `3.6.x`, and by some odd reasons you may have projects in any of those versions, and you need to handle it with your applications mean while develop.

Then, I found out that with a feature available in Ubuntu, called `update-alternatives` you may switch of Python version anytime you want, without delete or make any manual symlink for binaries.

For example, you have your environment as it comes, with python `3.6.x`, and you check it with

    $ python3 --version
    Python 3.6.8

And let's say now want to use `3.7` and work with it in our environment, so we proceed to install it, as usual

    $ sudo apt update -y && sudo apt install python3.7

Now we need to configure our `update-alternatives` in order to be able to switch of versions

    $ sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
    $ sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2

So, the alternative #1 will be 3.6 and alternative #2 3.7.

To check or configure the alternative of Python to use we need to run the command `sudo update-alternatives --config python3`, and the result will be similar to

    sudo update-alternatives --config python3

    There are 2 choices for the alternative python3 (providing /usr/bin/python3).

    Selection    Path                Priority   Status
    ------------------------------------------------------------
    0            /usr/bin/python3.7   2         auto mode
    1            /usr/bin/python3.6   1         manual mode
    * 2            /usr/bin/python3.7   2         manual mode

    Press <enter> to keep the current choice[*], or type selection number: 

And we are prompted to enter a number between 0 and 2, in this example, to select wether Python 3.6 or 3.7. And we may see that the default option is 3.7 at selection `0`.

After you select the option that you wan to use, you may check the python version

    python --version

Are you want to back to old options? Make this

    $ sudo update-alternatives --list python3
    $ sudo update-alternatives --remove python3 /usr/bin/python3.10


# Alternative 2

.bashrc

    alias python3='/usr/bin/python3.11'