# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.44.tar.gz'
  sha256 '00d0e88d9902034a774cbf3d88eea3b17611e559ee0b481b084ba54a14eb9f00'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.44"
    sha256 cellar: :any, arm64_linux: "24993a1de15492ffa3d97d8f758a140f4ebd4a8317909ee437beb5d0d51d8772"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5f2bb996bf39a87789d390d6be0db0de05909b841f5826499db7409c1c133280"
    sha256 cellar: :any_skip_relocation, sequoia: "2610cc05a2b7560a3c233679b44ea0dfab95e4ab6237c700feb5260ef4142de4"
    sha256 cellar: :any, x86_64_linux: "5b67edb807aa220fc8dde00a14a19ebec2336101d91b2ba29b766130d1161099"
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
