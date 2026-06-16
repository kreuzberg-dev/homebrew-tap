# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.72.tar.gz'
  sha256 'd13b299e564f667c5fd1faf16b931869eaf326455b38884fe549b78f1f0dfa64'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.71"
    sha256 cellar: :any, arm64_linux: "181cf0333b31b543dee8dfb2728464941325b6d6434b15ca08d9a85c57465a78"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "52cf9ec45e16cabb5068b42e3cc331e8b9a472705bf0477b31622aaadbb28bf7"
    sha256 cellar: :any_skip_relocation, sequoia: "c9ac5091ec21b39beb58691c7786080c8af7cd918fb3eb6d778f647753603c12"
    sha256 cellar: :any, x86_64_linux: "ac8fcf83d109fc81d916936bb736b18bd8f7dde4babbd891a4a839440affe0b1"
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
