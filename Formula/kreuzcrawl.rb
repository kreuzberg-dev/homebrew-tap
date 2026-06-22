# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.86.tar.gz'
  sha256 'cbb5d49aa9dfce561c89919bc6f9ec5fda5e94e11f6e296ebc47d6a1e825320f'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.86"
    sha256 cellar: :any, arm64_linux: "bea8d0e1986eb9711dd097cc4aa247d9f2612fdc156039080c0af71e6aa99ba5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5040375b5afdff531fbbf622932c0404ebe516cf1624e0ed8db01f4dedb3926c"
    sha256 cellar: :any_skip_relocation, sequoia: "31b77ef5dec1a646e1cab01d421e7608edd95a89866a326d414da01d3376e0b7"
    sha256 cellar: :any, x86_64_linux: "eef24932b7f807eab26bc9f7973fae27fec5d4f7c3d22a96fc3d917b1cc288b0"
  end

  head 'https://github.com/kreuzberg-dev/kreuzcrawl.git', branch: 'main'

  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'rust' => :build

  def install
    ENV['OPENSSL_DIR'] = Formula['openssl'].opt_prefix
    system 'cargo', 'install', '--features', 'api,mcp,mcp-http', *std_cargo_args(path: 'crates/kreuzcrawl-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kreuzcrawl --version")
  end
end
