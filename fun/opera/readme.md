## https://gist.github.com/Thomas-Ln/c4ae803e90f9984b6612c8983c8fde1f
# Install libffmpeg.so for Vivaldi and Opera
> Troubleshooting videos issues in chromium based browsers

## WARNING
Be aware that this manipulation could cause your browser to not launch anymore or make your pages crash !  
So be sure to have a backup of your datas before doing it.  

## Find the chromium version your browser is based on
Goto `opera://about` or `vivaldi://about`,  
then `Ctrl+F` to find `'Chrome'` in the user-agent,  
version number is Chrome/`XX`.other_numbers .  

#### 1. Download `.deb` package
Go [here](http://security.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/) and download the `chromium-codecs-ffmpeg-extra_XX` where `XX` is your chromium version.  
( i386 refers to 32bits  & amd64 to 64bits version)  

#### 2. Extract `data.tar.xz` 
```
cd <directory-where-you-download-.deb>
ar x <.deb-you-just-download> data.tar.xz
```

#### 3. then Extract `libffmpeg.so`
```
tar -xJf data.tar.xz --strip-components=4 ./usr/lib/chromium-browser/libffmpeg.so
```

## Copy libffmpeg.so in the browser folder
Find where the browser folder is ! 
Usually :
```
# Vivaldi
cp libffmpeg.so /opt/vivaldi/lib/

# Opera
cp libffmpeg.so /usr/lib/x86_64-linux-gnu/opera
```

## Notes
On the browser's update, libffmpeg.so could become incompatible again, and make you repeat all the process 😮‍💨

## Resources
⋅ [OperaBrowser Wiki (Reddit)](https://www.reddit.com/r/operabrowser/wiki/opera/linux_libffmpeg_config) - you will find some great advices there, go checkout !  
⋅ [Original Gist](https://gist.github.com/hauke96/5d808ff06e695c752783f4054232a4a9) - "*Install libffmpeg.so in vivaldi*"