# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.86.tar.gz'
  sha256 'cbb5d49aa9dfce561c89919bc6f9ec5fda5e94e11f6e296ebc47d6a1e825320f'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.85"
    sha256 cellar: :any, arm64_linux: "85e6578d5db582769afd6e50db10a3c56923908014423503a43a9d0b02ccfecb"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a148a1058ce1066992c7668653e6d0d69d01bce0f6ee074b68269af315b0e01b"
    sha256 cellar: :any_skip_relocation, sequoia: "e56272aa894d389386cd008687f372519c8fa21d576cab3438b37d03197b5b50"
    sha256 cellar: :any, x86_64_linux: "4775df39542f170fae7a1028b9f99831bd83f5e7c8f6225d465524a655af730c"
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
