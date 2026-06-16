# homebrew-tap

Homebrew tap for [YutaSugimura](https://github.com/YutaSugimura)'s tools.

## gmaps

[`gmaps-cli`](https://github.com/YutaSugimura/gmaps-cli) — a macOS CLI for the
Google Maps Platform (Geocoding, Places API, Routes API) with CoreLocation GPS.

### Install

```sh
brew tap YutaSugimura/tap
brew trust YutaSugimura/tap        # Homebrew 5.x requires trusting third-party taps once
brew install --cask gmaps
gmaps --version
```

> Apple Silicon only. `gmaps` is distributed as a Developer ID signed and
> notarized `.app` bundle (CoreLocation needs an app bundle); the `gmaps`
> binary inside it is symlinked onto your `PATH` by Homebrew, so no manual
> symlink or `PATH` editing is needed.
>
> Intel Macs: build from source — see the
> [gmaps-cli README](https://github.com/YutaSugimura/gmaps-cli#development-setup).

### First-time setup

Run the interactive setup wizard once after installing:

```sh
gmaps init
```

It walks you through:

- **API key** — your Google Maps Platform key (masked input). Get one at the
  [Cloud Console](https://console.cloud.google.com/google/maps-apis/credentials)
  and enable **Geocoding API**, **Places API (New)**, and **Routes API**. The
  wizard verifies the key with a live request before saving.
- **Default location source** — a fixed place (e.g. `home`), GPS via
  CoreLocation (`gmaps -H` / `--here`), or always-manual (`--location`).
- **Language / region** — e.g. `ja` / `JP`.

Re-run `gmaps init` anytime to change settings (press Enter to keep an
existing value). Settings live under `~/.config/gmaps/` (`config.yaml`,
`places.yaml`; mode `0600`).

The first `gmaps -H` invocation triggers the macOS Location Services
prompt; approve `gmaps` under **System Settings › Privacy & Security ›
Location Services**.

### Upgrade

```sh
brew upgrade --cask gmaps
```

### Clean reinstall / uninstall

```sh
# 1. Remove the app and the `gmaps` command
brew uninstall --cask gmaps

# 2. Remove your config and saved places
rm -rf ~/.config/gmaps

# 3. (optional) Remove the tap
brew untap YutaSugimura/tap
```

To revoke the Location Services permission, toggle `gmaps` **off** under
**System Settings › Privacy & Security › Location Services**. macOS keeps
location authorization in a SIP-protected store that `tccutil` cannot reset,
and the permission survives an uninstall/reinstall (the bundle id is
unchanged).

For a clean reinstall, run the steps above, then install again and
re-run setup:

```sh
brew install --cask gmaps
gmaps init
```

Full installation notes (including the prebuilt-zip and from-source paths)
live in the
[gmaps-cli INSTALL.md](https://github.com/YutaSugimura/gmaps-cli/blob/main/INSTALL.md).
