# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.24.16.tar.gz"
  sha256 "f935f9f016226fbb004fd1fc161336cea75b2fdd49c36f5d0df46c56f8f60d16"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.24.14"
    sha256 cellar: :any, arm64_linux: "0eed6a123efa8ba27faa3f06434b9edf53e8d0d87eb9313b260e834788e01dc4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c3fb768170bb3c8c37b436deeda584ffcce5f7ffca8afc3c89c0cf278e7176a3"
    sha256 cellar: :any_skip_relocation, sequoia: "6b3e6db547cc27b3b90c2b30568226ac787b672c43c309e7ebd3e8a4585a5427"
    sha256 cellar: :any, x86_64_linux: "9515ebe483947c93f08207a800aff6e172e929e8de28ae19aa30ffe44e968dbb"
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
