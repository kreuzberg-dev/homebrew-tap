# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/xberg-io/crawlberg'
  url 'https://github.com/xberg-io/crawlberg/archive/v1.0.0.tar.gz'
  sha256 '5222b70e7f01fd06cbd697bf94af3564e6c047d9b5ca10b1d7209970cff73413'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.0.0"
    sha256 cellar: :any, arm64_linux: "ef20d5239ec93219995d9724418a66aadde6aa8a3ae72f86e2d1f59d5db1c3ad"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ff10610b079a3d9725ac4432878d12a2f8ca19c692b42c742a977246086932ff"
    sha256 cellar: :any_skip_relocation, sequoia: "4913c6fae76b0564782b67dc32f7696d0ef978eeb681ef6ef023223f747b8ae9"
    sha256 cellar: :any, x86_64_linux: "2fd931c0bc4f24969b9da7584441f5a3b543049061f5b32ee7c476b1ff3cf1c8"
  end

  head 'https://github.com/xberg-io/crawlberg.git', branch: 'main'

  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'rust' => :build

  def install
    ENV['OPENSSL_DIR'] = Formula['openssl'].opt_prefix
    system 'cargo', 'install', '--features', 'api,mcp,mcp-http', *std_cargo_args(path: 'crates/crawlberg-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/crawlberg --version")
  end
end
