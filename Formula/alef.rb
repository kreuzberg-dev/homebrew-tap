# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.21.0.tar.gz"
  sha256 "c700723e3f7264d52921b51ecc972978fbbac815107b5c1b0c6a0b41e737c3f4"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.21.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "ecdd68cffc6cea1a3b5fda26c5a971ece2bd9089e1dd5c44135bf53b2abd495f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cfb55020e9653d52f5de913728785a33d650b9606ea60eb7fa87da0e94cd5d38"
    sha256 cellar: :any_skip_relocation, sequoia: "722e24c43c17f7ada30ea4521043b56ab42acfad5358e5cf20e81f0edd337d5e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4a2bf962588e0a855250aaec9e508463cd926aa6de3d030cbfa859f3128c3be4"
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
