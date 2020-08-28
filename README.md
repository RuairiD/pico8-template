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
A dummy `audio.p8` cart exists purely for SFX and music composition. Running `make audio` opens the audio cart in PICO-8. Running `save` in PICO-8 (without any filename) will write back any changes. The `make dev` and `make p8` targets pull the SFX and music data from `audio.p8` when building the game.

### Where can I set the .p8.png label?
`label.txt`
