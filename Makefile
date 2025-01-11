.PHONY: build gen clean build_apk_relese
build:
	@echo "...Generating files..."
	@fvm flutter pub run build_runner build --delete-conflicting-outputs

watch:
	@echo "...Generating files..."
	@fvm flutter pub run build_runner watch --delete-conflicting-outputs --use-polling-watcher

l10n:
	@echo "...Generating localization files..."
	@fvm flutter gen-l10n
get:
	@echo "...Getting dependencies.."
	@fvm flutter pub get

clean: ## Cleans the environment
	@echo "...Cleaning the project..."
	@fvm flutter clean
	@fvm flutter pub get

build_apk_relese:
	@echo "...Building release apk..."
	@fvm flutter build apk --release

set_flutter_3_19_0:
	@echo "...Setting to flutter 3.19.0..."
	@fvm use 3.19.0


assemble_debug: ## download debug android dependencies
	@echo "...Downloading debug android dependencies..."
	@(cd android && ./gradlew assembleDebug)

