# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://xberg.io'
  url "https://github.com/xberg-io/kreuzberg/archive/v5.0.0-rc.32.tar.gz"
  sha256 "73cb59f4b5ea9e7ed5919b1d8b71add947dd5d66cc2445ac88a8c26ff18a048a"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/kreuzberg/releases/download/v5.0.0-rc.32"
    sha256 cellar: :any, arm64_linux: "19399433781edf3c34343376161e8217e9ce4f70b962bae7c4dd6f2c7af17b66"
    sha256 cellar: :any, arm64_tahoe: "4ad5605571a94b6f8148fea188bd3cdab209b44622ac9317efb71552c44d4a08"
    sha256 cellar: :any, x86_64_linux: "dc86df6f1f1cd2dfbf4fa51b0069909a9cddf4fdb3344de7bf86ed8e5395fa81"
  end

  head 'https://github.com/xberg-io/kreuzberg.git', branch: 'main'

  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'rust' => :build
  depends_on 'libheif'
  depends_on 'openssl@3'
  depends_on 'tesseract'

  def install
    ENV['OPENSSL_DIR'] = Formula['openssl'].opt_prefix
    system 'cargo', 'install', '--features', 'api,mcp,mcp-http', *std_cargo_args(path: 'crates/kreuzberg-cli')
    bin.install_symlink bin/'kreuzberg' => 'xberg'
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kreuzberg --version")
  end
end
