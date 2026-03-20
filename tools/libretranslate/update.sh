# 1. Activate the environment
# We assume you are already in the correct directory
source ./bin/activate

# 2. Upgrade pip itself (good practice for stability)
python -m pip install --upgrade pip

# 3. Upgrade LibreTranslate to the latest version
pip install --upgrade libretranslate

# 4. Update and download all language models
# The --update-models flag ensures it checks for newer versions of the data
libretranslate --update-models --load-only
