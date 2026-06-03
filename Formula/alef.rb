# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.22.18.tar.gz"
  sha256 "3ef72edeafef5f7a06ff1e4e0ba4fbe4c3fbf03143980da8b35f338f50cd6049"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.22.17"
    sha256 cellar: :any, arm64_linux: "7c9bdd8d21b7363cc8c41049b4ae358a912755c95ebd5975f0a08232b78c4a33"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4931f6dfe9ec159a1fa567e6edeebcd14c065ecc0721d80a329d2ab923b3aa50"
    sha256 cellar: :any_skip_relocation, sequoia: "66452a01470ac2c6ba1aa1689e7a191c386498df8bad4dbe71ca61a443adfaed"
    sha256 cellar: :any, x86_64_linux: "16b56bfd61a0cbf6f599d005cf6baa62e5aaeb27a5064c9c292b16f8fa4bced6"
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
