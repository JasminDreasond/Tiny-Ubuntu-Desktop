## Stable Diffusion

https://github.com/lllyasviel/stable-diffusion-webui-forge

```sh
alias sdforge-start='cd /path/stable-diffusion/ && export QT_QPA_PLATFORM=offscreen && ./webui_forge.sh --xformers --pin-shared-memory --cuda-malloc --cuda-stream'
```

## OneTrainer

https://github.com/Nerogar/OneTrainer

I recommend manual installation.

## Libre Translate

https://github.com/LibreTranslate/LibreTranslate

https://github.com/LibreTranslate/LibreTranslate/blob/main/CONTRIBUTING.md

I recommend you build and run using Docker Compose.

```sh
docker compose up -d --build
``` 