# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.30.12.tar.gz"
  sha256 "df96692b265145802ffe094967bd532a252572f0fdfbd2d3d81951c9ebed21b9"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.30.11"
    sha256 cellar: :any, arm64_linux: "4c3dc20548ee269efbb0241263685c5a05780d7d8de9b43918fc95f36c6d7855"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "8e232da229b1f94f280df543a7c43e950238e15b264ba319ecc670d3f9536c1f"
    sha256 cellar: :any_skip_relocation, sequoia: "2dc326a47d306682ea2659bce2ab9c16a834775ffa2e37fd00f4ea360a837ba8"
    sha256 cellar: :any, x86_64_linux: "cbb6d6a5b4175c7921a6fd0ca0ac5ff6be7187a42b225bc2abff6a1dc501d315"
  end

  head 'https://github.com/xberg-io/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
