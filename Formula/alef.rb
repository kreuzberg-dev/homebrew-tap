# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.11.tar.gz"
  sha256 "492188f2e9750f94561ab9139d7eb555266411d71df395d7f3dc7ad1cb6df077"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.11"
    sha256 cellar: :any, arm64_linux: "ff32c8f870d259cda5ed98cdccccc59f548d65673fdc515ffc4beeed2aaccc3e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0f3c1493d56bf0a9e19a91c1f53f6f2048f02432855c5bb8ac70536ccff532e8"
    sha256 cellar: :any_skip_relocation, sequoia: "0636a9e6e6d913dcea10e06262018c6d64d5adbc0e9b201eb004f07e24087126"
    sha256 cellar: :any, x86_64_linux: "461d31c27de0a4c6ba15b052a92ae6be94ddd3433fc380117da82d6df02f10ee"
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
