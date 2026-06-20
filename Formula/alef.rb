# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.52.tar.gz"
  sha256 "b0ec14e916328862f3707e1c4c1cc3388c341271968100be393c8aac4a1f6c17"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.52"
    sha256 cellar: :any, arm64_linux: "8dc1e88b6b18d2e49402f082923144f339e48db30b6ccaa2b406211b9f2050d1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a5f6a71722b25c81bcbbe68bfc042987ce4c112e7b19e5092e89551cdff802e6"
    sha256 cellar: :any_skip_relocation, sequoia: "22419f12c761895ec18d566fc4e532ec5c23873fa28caccb84fe0fcebc2920ec"
    sha256 cellar: :any, x86_64_linux: "164024bfb520fc3c3f1a943ddfb798f2a069a82a43e37dac5a88a5205fe91b32"
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
