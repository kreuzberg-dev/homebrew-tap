# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.25.tar.gz"
  sha256 "25ec412535148dd5ebd3c9f02ce7a7a495164151eb3d8468d354188942be3328"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.24"
    sha256 cellar: :any, arm64_linux: "6d2c3b645010f1d257247ee98fde8dba87d27094a508bdcbe38ee6e3d02b8011"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "65bb9921dda137dd84ad95dba0e889a8cbe96a31b2a72d0db420adf5fd3910da"
    sha256 cellar: :any_skip_relocation, sequoia: "b71c8e16c50f910d11ccdb043e706216f9eb2ac49e17c7801edcc74ecb91d96b"
    sha256 cellar: :any, x86_64_linux: "189fe1c21eb9bb8ffe72e0ddf08113a97e429f3d21cde9f01766780e866ca59c"
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
