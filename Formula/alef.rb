# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.17.tar.gz"
  sha256 "12b68e04d48cde74cc3c936af5b74f3a972b4881624925879c3e31afe60fb4ae"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.16"
    sha256 cellar: :any, arm64_linux: "20fbae297b572fd05e92fe744e5836e0ac270e112fb744bc1c23d96f1c78e26c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d8a727eb0fb42f1aea2c13df100647db40b7f3a98b18fc53b3ce7d6242646e9a"
    sha256 cellar: :any_skip_relocation, sequoia: "e8923ea3ce725e73c8947ff10eb2bb438f31654451fc14c0d7474902d071e490"
    sha256 cellar: :any, x86_64_linux: "ecb360d8edf44793269a6ca0c65a9bf88b350996c3550289bb9db4d810f2b866"
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
