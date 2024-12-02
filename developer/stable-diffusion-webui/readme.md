https://civitai.com/

Python 3.10

## Start Stable Diffusion Forge

This script works with the `webui_forge.sh` file in this folder!

```sh
alias sdforge-start='cd /path/stable-diffusion/ && export QT_QPA_PLATFORM=offscreen && ./webui_forge.sh --xformers --pin-shared-memory --cuda-malloc --cuda-stream'
```

### Optional

    --always-offload-from-vram