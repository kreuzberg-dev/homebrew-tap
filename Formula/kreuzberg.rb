# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v5.0.0-rc.31.tar.gz"
  sha256 "772f365e2d13e51fb523688c361e6b4bf92d7a96fe9a0ee98072d0357b633488"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v5.0.0-rc.30"
    sha256 cellar: :any, arm64_linux: "c0be671dc385f5a10c8728ff4271cbdeba97997b7429a194322cb144d7f613a2"
    sha256 cellar: :any, arm64_sequoia: "69dcf82ebc7ec8662ec37e246058333537d965fec4a89c8fd4e433a0c05d014b"
    sha256 cellar: :any, x86_64_linux: "8dbe133b06eeabd65176b297b3d3109e4c47650338af4fb69accde9387dc1f3a"
  end

  head 'https://github.com/kreuzberg-dev/kreuzberg.git', branch: 'main'

  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'rust' => :build
  depends_on 'libheif'
  depends_on 'openssl@3'
  depends_on 'tesseract'

  def install
    ENV['OPENSSL_DIR'] = Formula['openssl'].opt_prefix
    system 'cargo', 'install', '--features', 'api,mcp,mcp-http', *std_cargo_args(path: 'crates/kreuzberg-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kreuzberg --version")
  end
end
