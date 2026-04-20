# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://kreuzberg.dev'
  url 'https://github.com/kreuzberg-dev/kreuzberg/archive/v4.9.2.tar.gz'
  sha256 '8510765b792b2467b981407a355bfaeda9bed53ee94788063ed1fafe56185192'
  license 'MIT'
  head 'https://github.com/kreuzberg-dev/kreuzberg.git', branch: 'main'

  bottle do
    root_url 'https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.9.2'
    sha256 cellar: :any_skip_relocation,
           arm64_sequoia: 'c89671d4f38a8b758495698666e50c4b1e80bf40f781d4af72549d6387d562ce'
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
