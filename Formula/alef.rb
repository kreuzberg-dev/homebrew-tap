# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.22.16.tar.gz"
  sha256 "9aa5a8d371d2951d744c72ee131add222d1aae56e02848d074cd6612f7237897"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.22.15"
    sha256 cellar: :any, arm64_linux: "0ea6d7e19f3f9b64ee1bc1c45c4dcf84b54a903da4b0d3bdd2eb46c15bd243e0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cc292c82adbb7b40bca6e8d5071e2a36f2c5a396667de8e1183e1bed50781db0"
    sha256 cellar: :any_skip_relocation, sequoia: "01b181955cc3bfc25e8ef032dff1e7c2290f24443326b25cc06e64877a6e9fae"
    sha256 cellar: :any, x86_64_linux: "7109c2873aec003d95c04cac100d763ae1028bb7fe6a49ab5df9ae86f1cb1e61"
  end

  head 'https://github.com/kreuzberg-dev/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
