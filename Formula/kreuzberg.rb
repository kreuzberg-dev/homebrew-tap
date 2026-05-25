# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v5.0.0-rc.1.tar.gz"
  sha256 "3a57f14759a9e687795271c17918de298a52c0664c8f0c13895c6cee21be4d50"
  license 'MIT'
  head 'https://github.com/kreuzberg-dev/kreuzberg.git', branch: 'main'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.9.8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5d3ce96749f02a90c4ea4dd3515a9852e3e5b5f0ae0f923f2504edb6face8482"
  end

  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'rust' => :build

  def install
    ENV['OPENSSL_DIR'] = Formula['openssl'].opt_prefix
    system 'cargo', 'install', '--features', 'api,mcp,mcp-http', *std_cargo_args(path: 'crates/kreuzberg-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kreuzberg --version")
  end
end
