# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.56.tar.gz"
  sha256 "d8995828cac1bb531a4ff6cd55eabb30b69fcce0655302fe469bfa8f0834d559"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.56"
    sha256 cellar: :any, arm64_linux: "0fe42a76138d4355852e381249cf7e342401b0a876a5b9c4caa890c642f5719f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0484818189881a31aa7b1abfe0e755d0943137efbb112bd614aaae025f2407f1"
    sha256 cellar: :any_skip_relocation, sequoia: "3d47b4da9d942a3070c468802a1de467ef8fcd801d12a736bb0582990ace0f98"
    sha256 cellar: :any, x86_64_linux: "2e0e255c351129945c00dbaa412a111418d8a5b61cea017b29274dd7ceb4f06e"
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
