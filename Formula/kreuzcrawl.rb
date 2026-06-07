# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.48.tar.gz'
  sha256 '1581164ac36e05b17f239ea266317d66b8a9510e17312ba59dd03e35e4caa7b6'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.47"
    sha256 cellar: :any, arm64_linux: "21e3bc7718276b4ca30bf884924be000c29ee5984c46aac527c006b3c04d466c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bf56708033b9fa8a0a21bb585ea8b940ca8da077116bbf2683457d3410ed0edb"
    sha256 cellar: :any_skip_relocation, sequoia: "c8ea2facfe3e71ca9d8edb5ce1ced9a0a6a1e0445f4c174d58cc7a1dcec72359"
    sha256 cellar: :any, x86_64_linux: "a8b20746454dd87982b9bfe045863d4c0cb95553d49ea521768ff7ab7babdc36"
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
