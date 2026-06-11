# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.24.4.tar.gz"
  sha256 "2594999de2f0b507a0d40f8765ca63d61cac9387b2e739fd6f62f898da3ddc1a"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.24.2"
    sha256 cellar: :any, arm64_linux: "cb453d60bc28d729c57ff03e8785a9c31998638d5b8360708bfb873e7921ef57"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9499d818b8aa906819a0fc7d506c540b19f47905b247f3d3acd42ce0365332d1"
    sha256 cellar: :any_skip_relocation, sequoia: "761630f5a8b0a7e89a98d4dbaf92711db8faf48841dc71574cc2ece71aea5f0d"
    sha256 cellar: :any, x86_64_linux: "08b9fb64bb4a01841e4dbaea4c15d48db545367ae00aee8a41e6220444a368ee"
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
