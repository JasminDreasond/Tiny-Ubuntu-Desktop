# 1. Create the local directory
mkdir -p ./argos-translate

# 2. Create the symbolic link
# This links your local folder to the default Argos path
ln -s "$(pwd)/argos-translate" ~/.local/share/argos-translate

# 3. Install LibreTranslate in the virtual environment
python -m venv ./
source ./bin/activate
pip install libretranslate

# 4. Run LibreTranslate to update and download all language models
# The --load-only flag ensures it just prepares the assets and exits
libretranslate --load-only
