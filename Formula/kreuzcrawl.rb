# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.32.tar.gz'
  sha256 '113da5fa5739bda5d1aff41bc0b940e5c5482da9bdefcbd990ae952286cc8024'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.31"
    sha256 cellar: :any_skip_relocation, arm64_linux: "062ad820d419b3c0095284e9042251e072b7a0ccc046abf5d01365267585efa6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b1250fea21dd3aac45273041406b738e9de7b0bcdf1fbf574298e698d3aa97a2"
    sha256 cellar: :any_skip_relocation, sequoia: "5e85db16e5b4e025d5f4d475c7476a54e4079e9d0e3c2fe370d4b901bfd36fd3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "66f94f809901ed559efced2b877f0ff804834621eec7343955193442bf611e86"
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
