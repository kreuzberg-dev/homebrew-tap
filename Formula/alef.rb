# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.19.19.tar.gz"
  sha256 "74806377659c1e00ce6402384719e54a46c4371cf7fe3e489a3fcb7064919453"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.19.15"
    sha256 cellar: :any_skip_relocation, arm64_linux: "adb0582a3b0954db9ad8ecb13f2d0d8f52876d5f134b03041516a99fa2e8c489"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "41a2831a6283fe51dbea993c8ea182a22de11cdf2e10fc69da6bf3413985f9cb"
    sha256 cellar: :any_skip_relocation, sequoia: "f9699ae913f968b2b16439baf5c52aac78112e6478abe0567282040e53d86e4b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dcb48d9a34bbf6b32b6cdfdf2e7910ad8a4f342d25d12c7fe2e9001e81efa48e"
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
