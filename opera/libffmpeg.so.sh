read -p "What is the chromium-codecs-ffmpeg-extra file name? " deb_libffmpeg_file 

wget -q -O - http://security.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/$deb_libffmpeg_file

sudo mkdir chromium-browser

ar x $deb_libffmpeg_file libffmpeg.tar.xz

tar -xJf libffmpeg.tar.xz --strip-components=4 ./usr/lib/chromium-browser/libffmpeg.so

sudo rm $deb_libffmpeg_file
sudo rm libffmpeg.tar.xz