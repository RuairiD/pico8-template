.PHONY: p8
p8:
	mkdir -p build
	python tools/tmxtomap.py map.tmx build/map.txt
	python tools/pngtogfx.py sprites.png build/gfx.txt
	luamin -f main.lua > build/build.lua
	cat p8_segments/header.txt build/build.lua lib/gfx_header.txt build/gfx.txt lib/map_header.txt build/map.txt p8_segments/sfx.txt p8_segments/music.txt > build/release.p8
	cp build/release.p8 ~/Library/Application\ Support/pico-8/carts/
	rm build/map.txt

.PHONY: dev
dev:
	mkdir -p build
	python tools/tmxtomap.py map.tmx build/map.txt
	python tools/pngtogfx.py sprites.png build/gfx.txt
	cat p8_segments/header.txt main.lua lib/gfx_header.txt build/gfx.txt lib/map_header.txt build/map.txt p8_segments/sfx.txt p8_segments/music.txt > build/dev.p8
	rm build/map.txt
	~/pico-8/PICO-8.app/Contents/MacOS/pico8 -run build/dev.p8
