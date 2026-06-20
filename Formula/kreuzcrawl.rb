# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.82.tar.gz'
  sha256 'f40cd51642f133a43a23161ef8bf1e2f770cf91bbd56696cf5f608a88a41a92b'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.82"
    sha256 cellar: :any, arm64_linux: "76df528d0a03678be3441001bfa9d169811efc949bcc2f6e35469f77f288062d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b55ef9cc5a6881106639a133afa2f484e4626a44219e8d03779f26d0f7b20571"
    sha256 cellar: :any_skip_relocation, sequoia: "5e0215190f4e152d06925ec7b11b6d06586bb72e7f7b89e4a0c8daaab43215ac"
    sha256 cellar: :any, x86_64_linux: "299e2b4f40e08832ce35934f334f1032aa82d7115b958a2a9f7d573ffd94a111"
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
