# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.27.tar.gz"
  sha256 "7bce01a713627c817fe4076b402d2030256c85c15b70e21e5c5b00c1acc3a8cd"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.26"
    sha256 cellar: :any, arm64_linux: "4ee0a25eda1cd5ade40ae5be66e6c4d5bea09bafc958d0fe1ccb2f51e48c72be"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "88c83f0b2926478edb9d34a4784ca88f7924cac95b0e6f2437aa6c383d3df4f4"
    sha256 cellar: :any_skip_relocation, sequoia: "fe3f0c2396c5bdbd6a80a710072a1add2a8a9a17e34621fa6b23f1c73e7f1ca6"
    sha256 cellar: :any, x86_64_linux: "33677ff25460681412f2da4a2e84666ccc7380a5f746e06e72f37ddd93886f31"
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
