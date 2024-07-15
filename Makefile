run:
	@echo "running flutter on web"
	flutter run -d chrome --web-browser-flag="--disable-web-security"

build:
	@echo building
	 flutter build web --release --web-renderer canvaskit