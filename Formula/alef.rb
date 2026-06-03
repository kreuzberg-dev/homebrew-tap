# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.22.17.tar.gz"
  sha256 "d4f74b11b21a7b02c0664921823893bed9ec42551ca1a75108d97f2fd569ac1c"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.22.16"
    sha256 cellar: :any, arm64_linux: "d4791dfb3e3f6b6d440ef51c5d71014e2d948d8c65f46db7606fce04c59bf836"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6884f007493870d9e0de68e4895301f6690ed730dbdf517195e6624c1c0c6cb8"
    sha256 cellar: :any_skip_relocation, sequoia: "4c209cfd1157e1361d59f9c3afb2a20157877ae84f3cfc38628cb49aaa63e50e"
    sha256 cellar: :any, x86_64_linux: "96550dff85b8b26f02037e51bbda815995a094271c71a129054f54284376c651"
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
