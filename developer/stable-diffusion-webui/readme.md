https://civitai.com/

Python 3.10

## Start Stable Diffusion Forge

This script works with the `webui_forge.sh` file in this folder! You need insert it into your `/home/user/.bashrc` file.

```sh
alias sdforge-start='cd /path/stable-diffusion/ && export QT_QPA_PLATFORM=offscreen && ./webui_forge.sh --xformers --pin-shared-memory --cuda-malloc --cuda-stream'
```

### Optional

    --always-offload-from-vram

## Graphic cards tested
Nvidia GTX 1060 - 6GB VRAM

Nvidia Galax GeForce RTX 3060 - 12GB VRAM

**Recommended VRAM: 8GB**

If your video card isn't on the list, you'll have to find out whether it works or not.