# Reference
## https://ytdl-org.github.io/youtube-dl/download.html
### https://github.com/yt-dlp/yt-dlp

To install it right away for all UNIX users (Linux, OS X, etc.), type:

```sh
sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp
```

## Using browser cookies:

```sh
yt-dlp https://twitter.com/AAAAAGGHHHH/status/1674925051374866433 --cookies-from-browser BROWSER[:PROFILE_NAME_OR_PATH]
``` 

If you always need to use cookies during your downloads, it is recommended to do it on your linux. Open this file:

    /home/<user>/.bashrc

Now add this line to create a new command on your terminal:

```sh
alias tinydl='yt-dlp --cookies-from-browser BROWSER[:PROFILE_NAME_OR_PATH]'
```