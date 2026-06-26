# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.29.1.tar.gz"
  sha256 "76e6d68eb82437082d6863498aef6172aeb7605ba4f6056bd9cb32eedec5c020"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.29.1"
    sha256 cellar: :any, arm64_linux: "d8d548128c89d8d7c346f6181670196069534e737c36326632c206edf3522c19"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9ea8995e298cf406f6be01414a6921b4da3e8f0492d1290033ef28d2cca87222"
    sha256 cellar: :any_skip_relocation, sequoia: "185e0aebedc09312eea922d83a20e26064bb0e98db79f2646d06364f149f71bf"
    sha256 cellar: :any, x86_64_linux: "07f2c55a6232640864039ecf972c8be228b9dca21f982e0d1ce2d4fbfadee59d"
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
