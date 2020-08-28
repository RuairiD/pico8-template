pico8 = ~/pico-8/PICO-8.app/Contents/MacOS/pico8

.PHONY: p8
p8:
	mkdir -p build
	python tools/tmxtomap.py map.tmx build/map.txt
	python tools/pngtogfx.py sprites.png build/gfx.txt
	luamin -f main.lua > build/build.lua
	tail -n +12 audio.p8 > build/audio.txt
	cat lib/header.txt label.txt build/build.lua lib/gfx_header.txt build/gfx.txt lib/map_header.txt build/map.txt build/audio.txt > build/release.p8
	cp build/release.p8 ~/Library/Application\ Support/pico-8/carts/
	rm build/map.txt
	rm build/gfx.txt
	rm build/audio.txt

.PHONY: dev
dev:
	mkdir -p build
	python tools/tmxtomap.py map.tmx build/map.txt
	python tools/pngtogfx.py sprites.png build/gfx.txt
	tail -n +12 audio.p8 > build/audio.txt
	cat lib/header.txt label.txt main.lua lib/gfx_header.txt build/gfx.txt lib/map_header.txt build/map.txt build/audio.txt > build/dev.p8
	rm build/map.txt
	rm build/gfx.txt
	rm build/audio.txt
	$(pico8) -run build/dev.p8

.PHONY: audio
audio:
	$(pico8) -run audio.p8
