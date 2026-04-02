# 🌐 LibreTranslate - Custom Directory Setup

Welcome! This repository contains a set of shell scripts designed to set up and maintain **LibreTranslate** in a way that respects your disk space and organizational preferences.

## 🚀 Why this approach?

By default, LibreTranslate and Argos Translate store gigabytes of language models inside `~/.local/share/`. If your home partition is small or if you prefer keeping your AI tools on a dedicated high-speed drive (like an SSD), the default behavior is a bit annoying.

These scripts automate the process of:
1.  Creating a local storage folder inside this directory.
2.  **Symlinking** it to the system's expected path.
3.  Managing the Python Virtual Environment locally.

## 📂 File Structure

* `install.sh`: The "First Run" script. It creates the `./argos-translate` folder, links it to `~/.local/share/argos-translate`, sets up the Python environment, and downloads the initial models.
* `update.sh`: The maintenance script. Run this to upgrade the `libretranslate` package and refresh all language models to their latest versions.

## 🛠️ How to Use

Simply give execution permissions to the scripts and run them:

```bash
chmod +x *.sh
./install.sh
```

```bash
./update.sh
```

```bash
./start.sh
```

Python version tested: Python-3.10.14
