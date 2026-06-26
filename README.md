# xberg-io/homebrew-tap

Homebrew tap for Xberg packages.

## Installation

```bash
brew tap xberg-io/tap
brew install xberg
```

## Installation Speed

Xberg uses pre-built bottles for faster installation:
- With bottles: ~10 seconds
- Building from source: ~5-15 minutes

Bottles are automatically used when available for your platform. The formula falls back to building from source if your platform doesn't have a pre-built bottle.

### Supported Platforms

Pre-built bottles are available for:
- macOS ARM64 (Sequoia)
- macOS ARM64 (Sonoma)
- macOS Intel (Ventura and later)
- Linux x86_64

## Uninstall

```bash
brew uninstall xberg
brew untap xberg-io/tap
```
