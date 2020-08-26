.PHONY: p8
p8:
	mkdir -p build
	python tools/tmxtomap.py map.tmx p8_segments/map.txt
	luamin -f main.lua > build/build.lua
	cat p8_segments/header.txt build/build.lua lib/gfx_header.txt p8_segments/gfx.txt lib/map_header.txt p8_segments/map.txt p8_segments/sfx.txt p8_segments/music.txt > build/release.p8
	cp build/release.p8 ~/Library/Application\ Support/pico-8/carts/

.PHONY: dev
dev:
	mkdir -p build
	python tools/tmxtomap.py map.tmx p8_segments/map.txt
	cat p8_segments/header.txt main.lua lib/gfx_header.txt p8_segments/gfx.txt lib/map_header.txt p8_segments/map.txt p8_segments/sfx.txt p8_segments/music.txt > build/dev.p8
	~/pico-8/PICO-8.app/Contents/MacOS/pico8 -run build/dev.p8
