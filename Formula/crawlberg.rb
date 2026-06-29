# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/xberg-io/crawlberg'
  url 'https://github.com/xberg-io/crawlberg/archive/v1.0.1.tar.gz'
  sha256 '21d26c2f60ed51baa98720dc069871c0806355ae6258a1c720e3787ec2d0af96'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.0.1"
    sha256 cellar: :any, arm64_linux: "f3a3843e60b0bbd3d67e5c5ffd6761f5d29567cf235629d43a4e7595b5ea8f06"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "819fd8476b775148d7dcea3f950e33c94327bfc21f2fec608a5da1fc589231d8"
    sha256 cellar: :any_skip_relocation, sequoia: "fafbec71994aafde722af7fcf72d59dfd910b8a5ecb498d0f2bc3d906c524a15"
    sha256 cellar: :any, x86_64_linux: "0a84ede7f138df19815bce3c01d332f2d16777d715c0ae5ccd45822d6bcd7946"
  end

  head 'https://github.com/xberg-io/crawlberg.git', branch: 'main'

  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'rust' => :build

  def install
    ENV['OPENSSL_DIR'] = Formula['openssl'].opt_prefix
    system 'cargo', 'install', '--features', 'api,mcp,mcp-http', *std_cargo_args(path: 'crates/crawlberg-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/crawlberg --version")
  end
end
