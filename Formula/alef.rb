# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.26.2.tar.gz"
  sha256 "c724d78b6909c971866c854b20bc730b869dec13a946044ba193e0f670d34fbc"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.26.0"
    sha256 cellar: :any, arm64_linux: "005bc4048c04611db5a763d0bbc572cc2e9c2d5763d17d960f09400bd50f9ff5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9f8fcc70205253a89ebc6d7214a260d99773fd08ef40fba605657decba693371"
    sha256 cellar: :any_skip_relocation, sequoia: "3b712a66683f1db745dabedc9e75b2fc0a6ee24a96b623b6f77ca3d1ade25b5c"
    sha256 cellar: :any, x86_64_linux: "2d0c2146d0ef6791d953522a2543d975d8bb3912db48892c2cd1436b5042effa"
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
