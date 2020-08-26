# PICO-8 Template
#### An oddly specific template for making and building PICO-8 games.

## Features
* `Makefile` with targets for dev and release builds (dev build assumes PICO-8 is running on MacOS)
* Uses [luamin](https://github.com/mathiasbynens/luamin) to minify code and keep filesize/character count trim. 
* .png to PICO-8 gfx conversion.
* [Tiled](https://github.com/bjorn/tiled) support, including .tmx to PICO-8 map conversion.

### Installation
This template uses Python and Pillow for map and spritesheet conversion. A `virtualenv` is recommended.
```
virtualenv -p python3 venv
source venv/bin/activate
pip install -r requirements.txt
```

[luamin](https://github.com/mathiasbynens/luamin) must also be installed.
```
npm install -g luamin
```
Other installation methods can be found on its own README file.

### Building
* Both `make dev` and `make p8` convert `sprites.png` to gfx data and `map.tmx` to map data, before concatenating them with code, sfx data and music data to form a runnable p8.
* `make p8` minifies `main.lua` before building the `release.p8` file.
* `make dev` leaves code unchanged for debugging purposes, and also starts PICO-8 after building, running the built `dev.p8` file directly.
* When converting the `sprites.png` file into gfx data, if a pixel's colour is not part of PICO-8's palette, an eligible colour is chosen on a best-effort basis using [RGB distance](https://en.wikipedia.org/wiki/Color_difference#sRGB). These results can be a bit weird, so it's recommended to only use the PICO-8 in `sprites.png` anyway.

### Updating SFX and Music
Unlike sprites and maps, this template includes no processing for SFX or music in PICO-8. This template assumes you (like me) create SFX and music in a dummy cart elsewhere and copy them into:
* `p8_segments/sfx.txt` (SFX)
* `p8_segments/music.txt` (Music)

(**N.B.** the `__sfx__` and `__music__` headers are added elsewhere; do not include them in the `sfx.txt` and `music.txt` files)

### Where can I set the .p8.png label?
`p8_segments/header.txt`
