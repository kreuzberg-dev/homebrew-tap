# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.39.tar.gz'
  sha256 '3d3e7946b51ad8e4728608bee8c594de877607483cbf2036a5ee14acf378da69'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.39"
    sha256 cellar: :any_skip_relocation, arm64_linux: "db109bf665a5a8f0fdb63ec333cffb192e4a1b34d60f08d7bc9ac2d2ace8f96a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e1351c3d97535734f6cbb5e2f59d95dfae2b77b9e1017cf35bd8151896850cff"
    sha256 cellar: :any_skip_relocation, sequoia: "6d8baf9c503965136ce0892889e45fc1bd711e2644f086579eb6ef17181fb514"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a15e6b4c31231c95c284115ab72f191126dc77e4070a3703c78e9b7bec9b2b4d"
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
