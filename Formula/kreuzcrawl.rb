# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.1.0-rc.9.tar.gz'
  sha256 '3fb91894ecba04ca49faa68d58df99d41cddf8e4f69262ab34d30a88ee98b90d'
  license 'Elastic-2.0'
  head 'https://github.com/kreuzberg-dev/kreuzcrawl.git', branch: 'main'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "077ea647dfb02f30a545cd5ec1fc383a31066b329be9cef1c04ffe71c5518d6e"
  end

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
