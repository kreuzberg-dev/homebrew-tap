---
priority: medium
---

# Formula Maintenance

## Formula Types

**Source-build** (Rust/CMake, compile on install):
- `kreuzberg.rb`, `alef.rb`, `kreuzcrawl.rb` — build from tarball via `cargo install`

**Binary-only** (pre-built platform-specific artifacts):
- `kreuzberg-ffi.rb`, `libhtml-to-markdown.rb` — install pre-compiled `.dylib`/`.so`/`.a` + headers

## Version Bump Checklist

1. Update `url` and `version` fields
2. Update `sha256` for source tarball or per-platform binary tarballs
3. For bottles: run `scripts/build-bottles.sh`, update bottle `sha256` values from output
4. Verify `root_url` points to correct GitHub release tag

## `scripts/build-bottles.sh`

- Canonical script for building bottles on current platform
- Runs `brew install --build-bottle` then `brew bottle`
- Must be run on each target platform separately
- Output includes sha256 hashes to paste into formula's `bottle do` block
