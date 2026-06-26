# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/xberg-io/crawlberg'
  url 'https://github.com/xberg-io/crawlberg/archive/v1.0.0-rc.1.tar.gz'
  sha256 '253fe130e3931b3b49ebc89ee1e424ea7e473b71f57ddf26ac01f6d327c15a09'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.0.0-rc.1"
    sha256 cellar: :any, arm64_linux: "9374d026716807f0b1c90dfe05d72e48e039bf617238e0241b6b7c88d6d7e53d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "252fd41a13b447ebb4724dad88734ec48a35550b78bb70c776db1af647d86f88"
    sha256 cellar: :any_skip_relocation, sequoia: "eb8c9b1738f995ab3d9bfb15f981f94c9fe4f70833df3651773b08da159cee22"
    sha256 cellar: :any, x86_64_linux: "4dfdc06573bdd782e5e2ef19f514727f91c565df557f1d6b4239f904fd8de7a3"
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
