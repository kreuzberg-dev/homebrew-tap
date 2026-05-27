# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.36.tar.gz'
  sha256 '22a464fca51b3cc0427909e911a3754ebf6a0efc3e996f86b2b9477db32865e0'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.36"
    sha256 cellar: :any_skip_relocation, arm64_linux: "ef7d197220e18db2ba1e2705d458cb94a4d480ab18f670647775496ac44df0a6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "70833c3261cb682f0669d64ea36e00c81a1da51243c938a9df533accb4d9a549"
    sha256 cellar: :any_skip_relocation, sequoia: "c0e6e988c0827d87607ec4dffbb521cffb5ffaa6dc43ab99ab13c4f3ee05e147"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "91343843c05794cf70cb7848f9a3fbaec10f5b1cffe0026ba0b6f379f52fcf11"
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
