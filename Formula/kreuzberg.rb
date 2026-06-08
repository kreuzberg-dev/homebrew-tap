# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v5.0.0-rc.7.tar.gz"
  sha256 "e79fe37f2ce0f68431840d035791f9f9fc8f78e1f8518e121b73e2659fec66ca"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v5.0.0-rc.7"
    sha256 cellar: :any, arm64_linux: "ceaa2dde7adf4e26d049e2d88a734931a5ce14a87888b0c77737710a5a8e028c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7989b52caea28b85f8ddbcea3550da64ece1d76b86c0c101d5e9d218162fb98e"
    sha256 cellar: :any, x86_64_linux: "9c802fa17a66264f817a6c65d55e65379b240be29d8174129e4ffd4162e29518"
  end

  head 'https://github.com/kreuzberg-dev/kreuzberg.git', branch: 'main'

  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'rust' => :build

  def install
    ENV['OPENSSL_DIR'] = Formula['openssl'].opt_prefix
    system 'cargo', 'install', '--features', 'api,mcp,mcp-http', *std_cargo_args(path: 'crates/kreuzberg-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kreuzberg --version")
  end
end
