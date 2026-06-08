# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.51.tar.gz'
  sha256 '9273970504d46307c315314fd148f3518e215fb20c8a7078d1fd6a92f3b493ad'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.50"
    sha256 cellar: :any, arm64_linux: "d7f8ce471102d113cfaab4701212c0bc93eb5eecc9d552449ec58088c9339716"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fa02ec39c5f917d782da65b9922af948014a1a5e3c8ce90262a1a30025f1bd66"
    sha256 cellar: :any_skip_relocation, sequoia: "02973afbfb2b639e132e106a8b98dcfeb5a56bd7013d0c43216ad4a147ba99d0"
    sha256 cellar: :any, x86_64_linux: "9e9bb3ea7d1fd9731ef7f5f896312aa938a82b97c7281ec455f71c67f95db7dc"
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
