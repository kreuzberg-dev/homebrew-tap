# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.28.tar.gz'
  sha256 'fc3a736c4a189cf61f691f4496e760c51e60ab5fd14b7ac6d2c87cbab343da66'
  license 'Elastic-2.0'
  head 'https://github.com/kreuzberg-dev/kreuzcrawl.git', branch: 'main'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.27"
    sha256 cellar: :any_skip_relocation, arm64_linux: "1b716ad6b217f2b62cd8c5cf16c5a0d6b3fa5e0a8a29afd450caf200d5627805"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3f3e97fb93806d0ef9fa6bf0be6ade5646e0736cd34567bcbdcd6183a4d2ad14"
    sha256 cellar: :any_skip_relocation, sequoia: "dba018529960835ee3c95ce6ded390f4fd95a969a6820de831d5882b2f8c7e5c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7d6cd991f022ef26681ff892bae163495dd55ec8731c9ee435f81b5d7db173f8"
  end

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
