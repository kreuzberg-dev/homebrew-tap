# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.55.tar.gz'
  sha256 '8ee51d7ef80560ecdceb2075322fd08eabaee54ac03108faa68870a8c0369235'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.55"
    sha256 cellar: :any, arm64_linux: "2c64cde40337148c3a5305b70f631848d460131920ab2703c626ee78363ef69f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c6c3c8becc3b663d398c4a5f2c1b0172967c4b3c89580a156f59f7a2fcf02c81"
    sha256 cellar: :any_skip_relocation, sequoia: "90a7ca5e32310d312aeaebf9438dca5d15d1290836c05e91b5613880cad5fff4"
    sha256 cellar: :any, x86_64_linux: "8ecfaecbbdb3835a183037fab142b08c73225b9019d000de616d3f853d1837f5"
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
