# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v5.0.0-rc.4.tar.gz"
  sha256 "a225aed93abefa8ae7bae2cace596705aae6ec5f42876b531ed3d414ecc0eaa6"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v5.0.0-rc.4"
    sha256 cellar: :any, arm64_linux: "e9d229f6b508de09832a993ff72b3766ef9e64ac20472c7ab5f8a6af0953ba47"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "232b30474629229d91c69c2466081be7608ead72d26af865557de6b36c311cdf"
    sha256 cellar: :any, x86_64_linux: "d6a882acf385d928eea14f2a01a7278fbfae26d22b788ba5a54c2b0250af12ee"
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
