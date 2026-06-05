# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.41.tar.gz'
  sha256 '24f6b2952541fb86d3c9a5911c4ba44c2893b5c902b9f90b4dbc700f4c4724e7'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.41"
    sha256 cellar: :any, arm64_linux: "bb8231bd52da0ccc7cfe8abd2745eb2ac7298d909137f490ece6e3c04138d4a6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "354757f8665be8a13cf8bc2aa8c8f4ecb5328b2892b00d315e4a8cd9e0313ac7"
    sha256 cellar: :any_skip_relocation, sequoia: "0489189b669cb3417770f402f77463dbda306caf53a6db1fc2d6629b36f670d5"
    sha256 cellar: :any, x86_64_linux: "ee235fff29049a622700967a43fe10e703d7ebe029685780817fbf3865e6dfeb"
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
