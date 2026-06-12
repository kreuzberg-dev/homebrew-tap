# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.24.12.tar.gz"
  sha256 "03de3f4a47fb5691e4c00a74372107e2ee6d82894f0b9c439e44ff59e8fe1b85"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.24.10"
    sha256 cellar: :any, arm64_linux: "d2ad06fc999444cde2f73268a488eb06144b2ac944eb6abe129dada0e3b7a37d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "86c5c08101d602a51dd8addd97b2661483e795befd0db4b096c357634b1cf734"
    sha256 cellar: :any_skip_relocation, sequoia: "369674eefb17e533ba8d18432d8e33940ceacf558ab21ebdb9a8e0e93653fb8a"
    sha256 cellar: :any, x86_64_linux: "abc4619dcb9ed318099d877a5fbf366d444933a135767d5f78bdbc353d00815f"
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
