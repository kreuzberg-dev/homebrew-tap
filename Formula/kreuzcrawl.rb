# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.84.tar.gz'
  sha256 '0ec319b9bb141ec322d56a144c17f15740071aaef0d6d4448ccf872efc04d3ff'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.83"
    sha256 cellar: :any, arm64_linux: "edb8fd4dce6f74fdf1f02a08f50cb761fc5e2dd9b0f7a9867f97283acb865291"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7cb3108f0b6ed824a1cc065bd31bc154d7d868f7a6f3512c46a3ee8272abe795"
    sha256 cellar: :any_skip_relocation, sequoia: "8f91799a5dc59a267c777978230141f6e6fa9e4d8d835d8b998347a21f8d4a8a"
    sha256 cellar: :any, x86_64_linux: "b3163f33f007bc0f0d8cd598e816721f93c153c77f3587e85c3705b7b827a112"
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
