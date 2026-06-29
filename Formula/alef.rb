# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.30.1.tar.gz"
  sha256 "60f22b83a5f7b4512887c74537718f0f63aa5ef5ec5708b68f46d301e853fc55"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.30.1"
    sha256 cellar: :any, arm64_linux: "a9edcb9a3a1bbf2dc47347145b4f4fcab92d577d3e0a6de522250b1c2d2d99dc"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0556b85e5334cd0f934ee5b37e351c0701d58cfb63eadc16621e2ddfa3d8e94b"
    sha256 cellar: :any_skip_relocation, sequoia: "7fbaf8db629329640d4ca9939366abbcc74eca8995447c39c3ae89336f75010e"
    sha256 cellar: :any, x86_64_linux: "32efcb7d5c48c59f22f6b5d26a72af8615f71796fae417e90138a613fdd3a782"
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
