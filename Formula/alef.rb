# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.26.8.tar.gz"
  sha256 "81fa59ac7ada450da0f0193289050f877a2267d75ab11e6ea5d974f28828bee3"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.26.7"
    sha256 cellar: :any, arm64_linux: "be8296d240076f5c655ae0ec94e4ab28376e958be6e7dd5a773e4d61003998a9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "edb72eb54d0cd3af4f0ad1b3316110b8ead75a028cbb3f2c6f21f7c1b726db61"
    sha256 cellar: :any_skip_relocation, sequoia: "6171e08bec16451b3f500a83504fe75e48c733e1de25091231045187b2442746"
    sha256 cellar: :any, x86_64_linux: "0f19ba58b4dfa30bedfe2d20fc0f1918a001ac76d2410035b1a8fced4bef8357"
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
