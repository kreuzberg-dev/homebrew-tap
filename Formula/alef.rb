# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.39.tar.gz"
  sha256 "85b4736e2107b3902688dbd4a6664d14d82252c2cd95bd4e2465a2d848d9266e"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.38"
    sha256 cellar: :any, arm64_linux: "4f531d9074b69e122bc47e99a55abb9f1624c34d457186726327fae465cff238"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "526a17ab6050cc09a0f4cea1c6e309d45fefdfa6c6732f0efe9ef4700ea1c98c"
    sha256 cellar: :any_skip_relocation, sequoia: "64226e3cbcb6fcaffb6dcd68d528a6d6ab7ed58d01639d39b3173c6e3717080a"
    sha256 cellar: :any, x86_64_linux: "7ba31e6f7f2c653282f6de201748270e43e0b150e908ae37a14089c5ff8a5621"
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
