# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v5.0.0-rc.5.tar.gz"
  sha256 "325336348dac8493ee417b8c4c38cc9438fbb615662b7b3f79984f5ae000e1c2"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v5.0.0-rc.5"
    sha256 cellar: :any, arm64_linux: "4c1f1fa93815ce9c90e29d4d00a6c075dc3d6e1b250c00e10f34f0da0ef7fea1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cd43f57427ce148b6200227370292553ead01f27cf3110e68effdb279edeffac"
    sha256 cellar: :any, x86_64_linux: "d9aa80a7943a412b1150b28353782b3372b16b2d9960bff0202a9c97f3c40068"
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
