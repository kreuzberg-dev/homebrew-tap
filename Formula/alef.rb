# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.70.tar.gz"
  sha256 "666ee50b9393ca9e6fb8e44fb4761f4de28e618967027ca5a9ba91472e4d3315"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.67"
    sha256 cellar: :any, arm64_linux: "e7ebd7bbf8c56ff4fe894243e703d2eb99c273a1d18fcabbba2f1129fe2cafb4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "206b05e6f60d0d536f6bee9785a7e26355357656fa4e8a9262629cc329914081"
    sha256 cellar: :any_skip_relocation, sequoia: "f41955a23b00fac1e2b2f7c3868b72cdba992d9445b66efd1b0cfb1eb67cff5c"
    sha256 cellar: :any, x86_64_linux: "8d2399023c8b911d7c92ece169fe5effddb46e29a3ea0f76abf990e9a3a2face"
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
