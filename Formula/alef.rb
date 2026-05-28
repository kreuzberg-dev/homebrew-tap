# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.20.7.tar.gz"
  sha256 "654fdaf8486d8cd7c03c142e2f2eee52a3dbd07855780cff118938abae9f7151"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.20.7"
    sha256 cellar: :any_skip_relocation, arm64_linux: "712a9bf8db090998f895b2c19f07dbc42da386ec523aff290709c664a598f312"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8cb7203f28f59c191176f72a19e1b832c21314c1a0441c78aa676a20abdb5d37"
    sha256 cellar: :any_skip_relocation, sequoia: "7dd0a7e81e506e1024721a38ead19ef0835084ce936e3c159f4632408bd1f910"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a6d51349828eab7094359dd80e77c0db89fc04f890ccfbb7d7e0f0b16d6c5e3d"
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
