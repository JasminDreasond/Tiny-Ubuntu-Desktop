### https://www.baeldung.com/linux/exif-data-read-change

The utility we’ll be using throughout is the exiftool command. exiftool is a popular and free open-source tool for accessing and modifying EXIF metadata.

Some Linux distributions don’t have exiftool by default, so we may need to install it using the apt-get command:

```sh 
$ sudo apt-get install exiftool
```

As a result, we should be able to run the exiftool command and see no errors:

```sh
$ exiftool
Syntax:  exiftool [OPTIONS] FILE
Consult the exiftool documentation for a full list of options.
```

Now, we’re ready to run exiftool commands on our Linux machine.