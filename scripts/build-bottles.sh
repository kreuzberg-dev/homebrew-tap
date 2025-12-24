#!/bin/bash
# Build Homebrew bottles for current platform
# This script builds a bottle for the current macOS/Linux platform
# Usage: ./scripts/build-bottles.sh

set -e

echo "Building Homebrew bottle for kreuzberg..."

# Install from HEAD (development version) with bottle option
brew install --build-bottle kreuzberg

# Generate the bottle file for this platform
echo "Generating bottle..."
brew bottle kreuzberg

echo ""
echo "Bottle built successfully!"
echo ""
echo "Next steps:"
echo "1. Move the generated bottle (.tar.gz) to the releases section"
echo "2. Update the Formula/kreuzberg.rb with the sha256 hashes from 'brew bottle' output"
echo ""
