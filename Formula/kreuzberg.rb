# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v5.0.0-rc.17.tar.gz"
  sha256 "6534e10af3501312f1f4412e33eb4780b46a961c185879eca8d051c1c5c6fc6a"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v5.0.0-rc.14"
    sha256 cellar: :any, arm64_linux: "de5951fd983e994755176a9b4f888a4b940a96b7351642f47b5b2ac94f20f867"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "90e2194d5f0bd076c98b7dd605cdb72fff48d628c6dd4b23767b184f5a5c1d90"
    sha256 cellar: :any, x86_64_linux: "b19bb2a8d26ef03110b62b3b1c524608224778c04b4865ecd4255e6020cb41e3"
  end

  head 'https://github.com/kreuzberg-dev/kreuzberg.git', branch: 'main'

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
