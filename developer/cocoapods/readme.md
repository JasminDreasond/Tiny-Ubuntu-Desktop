# https://stackoverflow.com/questions/20939568/error-error-installing-cocoapods-error-failed-to-build-gem-native-extension

Run following command
```sh
brew cleanup -d -v 
```

Then run below command
```sh
brew install cocoapods 
```
Note: If you see failed to link then run brew link cocoapods

If linking is getting failed then run
```sh
brew link --overwrite cocoapods
```

This is how it get solved for me

For someone who is having m1 chip system they need to run this via Rosetta

select Terminal and press cmd(⌘)+I and check the "Open using Rosetta" option. ( For m1 chip based mac )