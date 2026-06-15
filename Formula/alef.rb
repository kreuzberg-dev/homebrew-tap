# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.10.tar.gz"
  sha256 "d02feb318aadc78dae7e75bb13a289cb4670b030135a2badd03419285e3620b3"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.9"
    sha256 cellar: :any, arm64_linux: "72f12ad0a6bff47063258fa28682ad1f08ce1011d774f1a7660b7adf6f7c0aa2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "08fa7a69070495f0dd93ba240e852f0083bcc1245d628da8859a1df5ca290527"
    sha256 cellar: :any_skip_relocation, sequoia: "50c5b285ba2b7d6c089016c671b71ce9b73a6c18adaa889910f99bab09f0a22a"
    sha256 cellar: :any, x86_64_linux: "c42ee5bfe499cb9b57e06d5c3fbfa351c1191cc4b1de6f9eed1d0164c5bf0da6"
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
