# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.49.tar.gz'
  sha256 'f737e2d580e5eda11a4e3edb954bb284263450aa215021f6bfc490f4eb816bee'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.48"
    sha256 cellar: :any, arm64_linux: "82b8ac2e768e79e930ef379500786f143bd40fece4494a1beba1512d5caa3a42"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "78479a83f873bcd2499e39e8ec2eddf1d88afaf62f65f25ab2a51a5f31e52833"
    sha256 cellar: :any_skip_relocation, sequoia: "76d43318ebbab70c424a1d83503d355ad8c18cf700243d26d92959186f49dde6"
    sha256 cellar: :any, x86_64_linux: "efd4106fdf8d1dae9f6934eb47f453142bf510cb3eff4da2872b0f8b51ab01b5"
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
