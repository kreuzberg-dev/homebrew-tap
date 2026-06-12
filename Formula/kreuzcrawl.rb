# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.55.tar.gz'
  sha256 '8ee51d7ef80560ecdceb2075322fd08eabaee54ac03108faa68870a8c0369235'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.53"
    sha256 cellar: :any, arm64_linux: "6f3a646393205b60364d49ef8d8a5c81f69fa51a83082c543b21aa328bb9c811"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8e60ec45a06624b84c245bd2a7f8f7a662a226498f2d43ee5e7d78fbca942923"
    sha256 cellar: :any_skip_relocation, sequoia: "d5e5893fc806bd43251f019c3a8744dc6acb30b970184f0928849d944a23de80"
    sha256 cellar: :any, x86_64_linux: "96e2feac16575969fe651a65ddeeb27f0f3ae9a616f9640d931d38ac43c4461f"
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
