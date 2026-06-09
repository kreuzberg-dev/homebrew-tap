# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.60.tar.gz"
  sha256 "6176e2b103da513818282feb8e7623396966daf21e3aaa5a94eadf68a6ca5ab1"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.60"
    sha256 cellar: :any, arm64_linux: "ca3a4e8d8a1e10dac6969bd1c290d7fae97676461f55814b4a454eb1ec3b750d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0ff23c1e403c17d61c5b0239687e9455c26c0b5349fc183d8e51cea2a54f2ddb"
    sha256 cellar: :any_skip_relocation, sequoia: "f899000ed46ec2519d0fa1093c148ec3a54eea37cbd80a75d975ce1f4859a3cd"
    sha256 cellar: :any, x86_64_linux: "3c6e615ba9687932a1a2b909bc46d28cbfe64cdc208664fa5651f28b36c0d52b"
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
