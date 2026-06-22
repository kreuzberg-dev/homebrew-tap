# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.26.0.tar.gz"
  sha256 "3de68efdeadb1a96d33a78ba5133cec223cd9474829e1d98bef84a41418152d4"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.60"
    sha256 cellar: :any, arm64_linux: "cc00bdeef8a5f5b673b9455d6238691cd7a70dc7e3c063431e673e446ad32622"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "84d5c6346b5143b109d076dfaaedb356e08e2425f84f6387261bc599316afec7"
    sha256 cellar: :any_skip_relocation, sequoia: "57e153b8a2a9718bbc4cfd440251a41a16853fa347a81b482197210836a3d907"
    sha256 cellar: :any, x86_64_linux: "cbef693ca66136dc683de521f9a98fe54880ccdfb0906ea81b8dcff6af08cef7"
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
