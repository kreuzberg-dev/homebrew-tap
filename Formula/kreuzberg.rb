# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://kreuzberg.dev'
  url 'https://github.com/kreuzberg-dev/kreuzberg/archive/v4.9.5.tar.gz'
  sha256 '19fbfb834a6ad4b7a7429435863eaa91b4b446937c4a3a17e4d00ce06f8b6c59'
  license 'MIT'
  head 'https://github.com/kreuzberg-dev/kreuzberg.git', branch: 'main'

  bottle do
    root_url 'https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.9.5'
    sha256 cellar: :any_skip_relocation, arm64_sequoia: '7094f953e9e64d819ca1c249eb0cbe788366f5470abe3a661c997b3032448515'
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
