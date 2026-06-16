# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.71.tar.gz'
  sha256 '22e06c2b04418d8d60bb5ccafff4f5b354fa30b1f0e339b09a96b49fe321e70e'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.70"
    sha256 cellar: :any, arm64_linux: "c914fa003e6534ff4b0e4e1b5c8d39411b95b02e2a6221ae93e0cb91de3dd6ef"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2fc4da4cbb7c7313c6a3af8970dea7264f7f19ee9b95d052a2f94d9da1176155"
    sha256 cellar: :any_skip_relocation, sequoia: "5dfdf84acad57309246c161c4fcb1b345c83ccd6d2219642c2bbe926e6f39e86"
    sha256 cellar: :any, x86_64_linux: "39ef2b25369f7cb88626cb67ae0c3e39d62e5103de2dad83c9b6a1d3335643ea"
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
