# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.66.tar.gz"
  sha256 "80549772564761e027ad9b2ee663b7b272dd7c3e4e94547fe4b191a34b0b5686"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.66"
    sha256 cellar: :any, arm64_linux: "268eea1d7d7891b980d1833acd8befad24cf95ca8e0b253df7d1d0779005c04e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8281f7789d19175dbe882b8442d849d0719c21f619bb982db92d9dd7a47346b3"
    sha256 cellar: :any_skip_relocation, sequoia: "b1c31ddf623294b6a45414f51bbe7197b2a3088f68271259bd505a63bdf7b368"
    sha256 cellar: :any, x86_64_linux: "a243699ce688bae8771438034f5ac447c47e809c4caa9330a21d6d11c1bf2fef"
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
