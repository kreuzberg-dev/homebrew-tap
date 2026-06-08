# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.49.tar.gz"
  sha256 "eea30530d9cb4325d4ba6a6c4ba284a23b5215d71db36c332daba1430567f29e"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.48"
    sha256 cellar: :any, arm64_linux: "de1dd97c628200462da4d659dda67aac8d73226027d7b3fe92a389271dc5d828"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8a28114b3fa04ceaf12849db779fdc11a1753ab5c521787f63bad7958fe29ba6"
    sha256 cellar: :any_skip_relocation, sequoia: "8cb025918e2d6bb5c91528bb364b5ab4ae5a4f463dc5d4a8f0dafd1c09cc4ea0"
    sha256 cellar: :any, x86_64_linux: "03ee36376aba6b0f401a73df0550ac7517f798908afc3eeab1ee15a49367f550"
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
