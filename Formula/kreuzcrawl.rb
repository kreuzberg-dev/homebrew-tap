# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.37.tar.gz'
  sha256 '5e3d0a0374c68e49b20f6ee57e8af77d6e309c0be55b5aa3426c64884de653fc'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.37"
    sha256 cellar: :any_skip_relocation, arm64_linux: "2a5214c0f970ee63959b04e08333a96174fb397b06bded6fb4919979630d0760"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a74a54ab71e88ad6f1e294205649ae39cb8635b18e7460ecf18e141713d55060"
    sha256 cellar: :any_skip_relocation, sequoia: "51e06b0abd2bd638bfe1e0517ad079f73ac73e3b3323b7b6c8957a6821fa58a8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "baf8cb7c5ddd880762246041653a71943d0bf4023e47283335a2cb6dfbf6eb66"
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
