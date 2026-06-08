# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.34.tar.gz"
  sha256 "54fafe07e8d46a5c1c902a862833987e0f0a1db253bca19d59739d9a9d35c0a0"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.33"
    sha256 cellar: :any, arm64_linux: "71fa2b519dc96a3f4f20407f64911b9a4f52af0dbca11e097400b83e79cf1525"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cf2e7d0ad76b68d5809794541903a7292583270fffbe3ad4e1c376ca0b67e04b"
    sha256 cellar: :any_skip_relocation, sequoia: "11c52f6fa57deb4f09bfaef58f2f0ac8b2d9b47e61f38d20002f93e48d32f156"
    sha256 cellar: :any, x86_64_linux: "9d077b11c1b2fc543ec54bf3f9b9141619d0742668af2764eb837639f2fc8d87"
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
