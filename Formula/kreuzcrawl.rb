# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.41.tar.gz'
  sha256 '24f6b2952541fb86d3c9a5911c4ba44c2893b5c902b9f90b4dbc700f4c4724e7'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.40"
    sha256 cellar: :any, arm64_linux: "a7e407c6be53346c858b076dcfdaf57ab7292d810e1732d45d8f62cc86ee3e35"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f917d9a72c0c3a54fd361d7f630a98c9bac2eee01f27a173d7cf95e9b4be1437"
    sha256 cellar: :any_skip_relocation, sequoia: "1971a181339404a67b53db5228ec76648ac487c3da4e9e251bc22e569f82c5b0"
    sha256 cellar: :any, x86_64_linux: "24ad3277fcbbb7817f5cda587bf4cebf7f0028fdd7b5487014e533da1b42e256"
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
