# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.53.tar.gz'
  sha256 'ccd675dbe7b034cf93e6b29056a620472688d040b058d5a537ff8dce8f75fcf5'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.52"
    sha256 cellar: :any, arm64_linux: "98be997762db2682e05d7cb8d6379d368e3fa79ece088a017028473ed2353620"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "01c9d32ef386aa0f380f4316882b58bc5d5b7f47692404f49dc62d3aecc46ddd"
    sha256 cellar: :any_skip_relocation, sequoia: "2283caa964a95ba4662c4c49231009b34e89adc1141ad8dc51bd5c874798002f"
    sha256 cellar: :any, x86_64_linux: "fb2bd0358e789abe8ec7c26e1c377152ece7f8876aa9219fba34cd6424863b0b"
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
