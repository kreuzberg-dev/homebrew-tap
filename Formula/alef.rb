# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.20.9.tar.gz"
  sha256 "5e8d53ab60c974775ac9713615d79f7bea0be077cec02ee6c410a2f2f2e0d856"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.20.8"
    sha256 cellar: :any_skip_relocation, arm64_linux: "ae181c5ed961bcb3286eb4613104a56b095ab5442ca724f037abf9eadb201e6a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a676dfa13e4305c2d81e7c6b450e25f1244dbf1a5f386dcaff2025bbcfd71135"
    sha256 cellar: :any_skip_relocation, sequoia: "0c259c640d125da7f1a050312703f86c96790b2549a31d04614bcec76e5d9bd5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "024db1a1de0128edfc161aa1a02f2208dc5351a8a088ead55573c69a91ab25e1"
  end

  head 'https://github.com/kreuzberg-dev/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
