# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.55.tar.gz"
  sha256 "de9ef78740d565e94ef1f39bdf3feea238c13f5ad9e440060c6cbb98c35c74ff"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.55"
    sha256 cellar: :any, arm64_linux: "ef4bb6745523ef8acbf645c7fab0a4d72f5db656933fd8e03a1c1d0c8abe2134"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "196cdf76eeb0c1719f029e7f272f3c4949b2cb695d1b5456faee9a3b31d894b3"
    sha256 cellar: :any_skip_relocation, sequoia: "48b4014d63f5f6d6eeeccf3e4ec167b5d39ca436e9c4eaf6f7ce155850c328d5"
    sha256 cellar: :any, x86_64_linux: "9f535824c0faddf3e49dcb25953313d0270109fa70bcfb8fd082e28191ae5694"
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
