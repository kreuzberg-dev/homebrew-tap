# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://kreuzberg.dev'
  url 'https://github.com/kreuzberg-dev/kreuzberg/archive/v4.9.2.tar.gz'
  sha256 "94bee2988d4df95ba93352a1ff4c243e740a979b683b91bd097f367c0f6b39c4"
  license 'MIT'
  head 'https://github.com/kreuzberg-dev/kreuzberg.git', branch: 'main'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.9.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8807695cfa9536fa2fe5204205fa21e02449555cb0d3ecbe21b840faca5d91bc"
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
