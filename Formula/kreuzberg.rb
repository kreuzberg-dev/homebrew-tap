# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v5.0.0-rc.10.tar.gz"
  sha256 "31084d9e77e4846fbabd02b101b2849ade298a54ae7067dea0cce3d2e7e0c180"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v5.0.0-rc.8"
    sha256 cellar: :any, arm64_linux: "40dd08c5f20d19db4189a84eef7fb21d0bfe98569a61d36230ef3470dd891128"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "51aebfad428ac9ce77be425431b2f0b9942fc36f7beb44ad7a467edd3ee74981"
    sha256 cellar: :any, x86_64_linux: "b9c423fbc99ad06612dc034e214344049e002bdb1c24806571e7ab39327d9e75"
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
