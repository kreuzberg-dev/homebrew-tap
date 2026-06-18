# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.77.tar.gz'
  sha256 '0b680cd660ac44bbc8db8caa98b1ba563f835d3823527485eff05bece51e1e19'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.72"
    sha256 cellar: :any, arm64_linux: "175cb062046769c804e26b4388292690499205e054dade5c98d1baeede645072"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "283b3d90283a6c5ffebefb88b7a252d206d5a08a7d477ee34f2c16501e2bdc4f"
    sha256 cellar: :any_skip_relocation, sequoia: "9d442313f164d4e8e52a5b205edd775ce5b046c3c7bfea113219ab4dda399b8b"
    sha256 cellar: :any, x86_64_linux: "ab98a8e01c531e452631eb462c5392a532e6c372da3be8f31cf6bda8125ee42f"
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
