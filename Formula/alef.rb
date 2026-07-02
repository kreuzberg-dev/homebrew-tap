# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.30.13.tar.gz"
  sha256 "4d6cece12ae9fba173722ee031049937d2d6c0ddb673699e9b20c5476bc6801c"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.30.13"
    sha256 cellar: :any, arm64_linux: "789dc0ea9132a37b18c8993d5dca11fd0da475377f181f5938b95f28d13bd6bf"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "ca60a004a508062cad9a1d4a44ba708958f2720bac291966834e17eba50bf044"
    sha256 cellar: :any_skip_relocation, sequoia: "c73d296b448d8a87c43cd45eeb1875de050f6af57c5086b705ae13de67eb5970"
    sha256 cellar: :any, x86_64_linux: "8e320b4bb7ddf6e1502c3e84631a38164456e78724b2cfc41538bfce70dbb52f"
  end

  head 'https://github.com/xberg-io/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
