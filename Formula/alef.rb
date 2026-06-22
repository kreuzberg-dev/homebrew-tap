# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.60.tar.gz"
  sha256 "0fa197f625537262dbab9f5126817dfc1641d379169d61e6d6fa0729ea96b3ce"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.59"
    sha256 cellar: :any, arm64_linux: "281ed61db4a47a2a42982ebc9de459564a3df47486dc677f791fbd69eea41b2d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "90343852c0f6392ed1ded57c4ff2f40ad9fc43950def7d77835a6ee381a9aa1c"
    sha256 cellar: :any_skip_relocation, sequoia: "3ac28249113ebe262225c0ab70034faa9758bba4039229ee519052270fad2711"
    sha256 cellar: :any, x86_64_linux: "2ec38329da420523304220e3f89327d9a5a879ca944b026671d1c2098332c02b"
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
