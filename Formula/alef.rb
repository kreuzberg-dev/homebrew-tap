# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.38.tar.gz"
  sha256 "69843ae06c88c425a564ca6590d984f9cfedc31ce8589f2d3662295829aa4379"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.37"
    sha256 cellar: :any, arm64_linux: "49becae9d219e55ecadc5d5e465115090ae60970600f9a1124c7a3c15fde825c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "43097274e998e60815b11fd46f4ac1d0751f8af44358075cdcb8d7c29b7938b0"
    sha256 cellar: :any_skip_relocation, sequoia: "f9bd41f95f668d6515d97d9237871c2f0c201f45b9de8f1a291c357147687dd8"
    sha256 cellar: :any, x86_64_linux: "c97415bc13f86dc67f143f98d62c32bab536c438f0b47b9e1f7e8725bd092240"
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
