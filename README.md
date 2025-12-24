# kreuzberg-dev/homebrew-tap

Homebrew tap for Kreuzberg packages.

## Installation

```bash
brew tap kreuzberg-dev/tap
brew install kreuzberg
```

## Installation Speed

Kreuzberg uses pre-built bottles for faster installation:
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
brew uninstall kreuzberg
brew untap kreuzberg-dev/tap
```
