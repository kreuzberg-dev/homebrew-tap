# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.6.tar.gz"
  sha256 "84650aa8b7a5d9680c84fb274b7ba3eabf6b31cc9559141be6dc4002f6687018"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.4"
    sha256 cellar: :any, arm64_linux: "c8543ff7d77cd0ebb0bd44380eb512426eae9a7a18ce429185548dc9d5a6e973"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "69ab175249cfdf903a7540345a6a4c2b4dcf4c98ab838ba559a64b966cde71c0"
    sha256 cellar: :any_skip_relocation, sequoia: "54bc8f3fe14d893d37d1444044ac5d8dd9e159f1ec0e6a523c6bfc65da2df946"
    sha256 cellar: :any, x86_64_linux: "766b8407538afedb7d4ded50fe0296dbdcd7404c3a49eb2db339454a5ad5b06f"
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
