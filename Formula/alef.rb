# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.14.tar.gz"
  sha256 "c567191ea3fe46f459c0ab67ea31b4ef08ea7938ad93d89a340b79bf7937c017"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.13"
    sha256 cellar: :any, arm64_linux: "c6d3a5bfe9c9517fe6cc0f8df96323437c82634fae40b63aaf177dcf5493d34b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d10ecf0c17e2c9ef5cb9305b767f9a5ee7a51594cb98a84f5a20af8efb107246"
    sha256 cellar: :any_skip_relocation, sequoia: "763cb1582962d90eac389d0892213a7ac3e8153560d477579016f296700e48a1"
    sha256 cellar: :any, x86_64_linux: "b9b52f6cd32b2e8e6aeda949306217e6f58146dd5d3dd3716276993d1e307b15"
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
