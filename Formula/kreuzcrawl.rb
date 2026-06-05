# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.42.tar.gz'
  sha256 'bb68b854dbcce6548a4e4b835c43c5978ff95c7abf53de66676809e6894c6137'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.42"
    sha256 cellar: :any, arm64_linux: "97a726d4f0a0adb3dd160c4b304542a164ba0581938c7d41b95dbe27a986602d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fa696e6f8fc1594c8da01cea8ea02b4ad99f2d86682af4cc59fd0f6440b0df8d"
    sha256 cellar: :any_skip_relocation, sequoia: "ba7d585e6c1e764eeb97408d97ba986d657754f9ed51e5655111eb97c857a488"
    sha256 cellar: :any, x86_64_linux: "e5b1cdefe124ca7e129219027d2a291439a1cfc05cb2131009eb255118b186a8"
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
