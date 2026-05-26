# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.32.tar.gz'
  sha256 '113da5fa5739bda5d1aff41bc0b940e5c5482da9bdefcbd990ae952286cc8024'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.32"
    sha256 cellar: :any_skip_relocation, arm64_linux: "1d3debf0c81225c086f22d8bf10264da8cd0498eceff72777ee963edebcb9b51"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c435fec2182f1c07d490bf3607f205763661cbe295a36327a790613204045898"
    sha256 cellar: :any_skip_relocation, sequoia: "c34b6b89740d3f3b36bd6f43626acbbf543f020ecb62cfaad04a6523c9766131"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e3ef048b46b0c73d1f4f83aea1be77a4e181e5226391da54d62b98fc23cb7580"
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
