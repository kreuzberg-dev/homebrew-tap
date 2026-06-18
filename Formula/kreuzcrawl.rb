# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.79.tar.gz'
  sha256 'a97be74743949ce84ff08d3d9294120c5d026b81d22955c3975771ebc7fa0946'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.79"
    sha256 cellar: :any, arm64_linux: "2c1b862a8260882b9791f534e95dc9b1082d095317efce5b3f790740b4195cf9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e7baaf0b46dc076698ec034a61403c09a29412353cbd7b270563e891d35e9670"
    sha256 cellar: :any_skip_relocation, sequoia: "4a7d272794de41a4cf98b54e952d49a688f39bb8183345eee3e7942088120c97"
    sha256 cellar: :any, x86_64_linux: "4628085f42848334de3c1fceccaddf7093e75e3d81b26efa15618cbef880e664"
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
