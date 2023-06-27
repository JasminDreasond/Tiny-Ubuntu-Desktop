https://capacitorjs.com/docs/getting-started

https://marketplace.visualstudio.com/items?itemName=ionic.ionic

    "@capacitor/android": "5.0.5",
    "@capacitor/app": "5.0.3",
    "@capacitor/cli": "5.0.5",
    "@capacitor/core": "5.0.5",
    "@capacitor/haptics": "5.0.4",
    "@capacitor/ios": "5.0.5",
    "@capacitor/keyboard": "5.0.4",
    "@capacitor/status-bar": "5.0.4"

    ============================================

    "start": "vite",
    "build": "cross-env NODE_OPTIONS=--max-old-space-size=8192 vite build",
    "lint": "yarn check:eslint && yarn check:prettier",
    "check:eslint": "eslint src/*",
    "check:prettier": "prettier --check .",
    "fix:prettier": "prettier --write .",
    "ionic:build": "tsc && cross-env NODE_OPTIONS=--max-old-space-size=8192 vite build",
    "ionic:serve": "vite dev --host"