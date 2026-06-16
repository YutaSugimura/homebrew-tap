# homebrew-tap

Homebrew tap for [YutaSugimura](https://github.com/YutaSugimura)'s tools.

## gmaps

[`gmaps-cli`](https://github.com/YutaSugimura/gmaps-cli) — a macOS CLI for the
Google Maps Platform (Geocoding, Places API, Routes API) with CoreLocation GPS.

```sh
brew install YutaSugimura/tap/gmaps
gmaps --version
```

> Apple Silicon only. `gmaps` is distributed as a Developer ID signed and
> notarized `.app` bundle (CoreLocation needs an app bundle); the `gmaps`
> binary inside it is symlinked onto your `PATH` by Homebrew. The first
> `gmaps -H` / `--here` triggers the Location Services authorization prompt.

Intel Macs: build from source — see the
[gmaps-cli README](https://github.com/YutaSugimura/gmaps-cli#development-setup).
