# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.74.tar.gz"
  sha256 "b7dca6e6bfd0b3a0f66bed1100456d444f486869d3a808cbf7ca3ac4bd3eb811"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.71"
    sha256 cellar: :any, arm64_linux: "67864275e8cd09115cb27907fc2176363e8ef46cc638abfb121f9eb907091e6b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "99d10b38c473a2e811eb446208f878e548484d2d0326539f621e12500e5ac395"
    sha256 cellar: :any_skip_relocation, sequoia: "676137ab84b37c62dbbab3eba485669bc0996b8fa4e197042873f85b89005a3d"
    sha256 cellar: :any, x86_64_linux: "5cabffcd8af118f05d120fb2cb14000457f484d3632e8eaeb0a07aa99d157a44"
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
