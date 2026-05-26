# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v5.0.0-rc.2.tar.gz"
  sha256 "f7eb5dbe75f7d67596ec0a0fac547b719233a48cd508945f2cee80509792f7cf"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v5.0.0-rc.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "ca9f3ed057b12ccde4b029d2527b6a4d5880fb43f28df48dc0241f1fd25696ed"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3615f4856f4fedd9b45bd67b8284a1471efc67123559551b13d11c3748cb54b2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8782dbf83d73a4d614350a1168b64b06b43e3450119f1fd05726e1b548da16b1"
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
