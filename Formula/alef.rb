# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.15.tar.gz"
  sha256 "ac309cd3e3b5b0f7eefe7751dcf6579fc598781bc1b726a09cc972786687f7ee"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.14"
    sha256 cellar: :any, arm64_linux: "d349119e955fe488a28a7e4b228cd01ae324352daf7edd615244126f3a16f1d7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "455c18e39916d384ab13833571234041077ed2400c0731a9396868a3d5c41788"
    sha256 cellar: :any_skip_relocation, sequoia: "472d23188350a7f1972da3acedbdd7956736ea18c9ac0492246cd85c816b2cb0"
    sha256 cellar: :any, x86_64_linux: "ca4ab5c0cac43a4cc434023d9f6eace6874c7b19c8914d96788f952346df72ce"
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
