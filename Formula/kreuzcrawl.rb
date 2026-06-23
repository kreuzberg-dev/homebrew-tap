# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.88.tar.gz'
  sha256 '12b0d4a6a47f2b95a7b65d327ab3ec89875002eb29e7c6bf6e149bb06148e417'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.87"
    sha256 cellar: :any, arm64_linux: "a64a4a26e41c1e5416773a173fb4b8d485c9628f1713fdc5075e5196258bf16a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7674a0447379683f6f2b1d630bdef8a072b803f287428b3e5ea2e62e788ddd0e"
    sha256 cellar: :any_skip_relocation, sequoia: "dbc5ef928e47f9e299d8cfbde87ba01b17ec279816d34358b70a6159c7f6c0ec"
    sha256 cellar: :any, x86_64_linux: "3c814989390bae99f5ceeccfc9b0267446b29c77d3ab6630b132c87c2eaf595b"
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
