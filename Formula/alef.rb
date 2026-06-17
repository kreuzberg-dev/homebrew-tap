# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.24.tar.gz"
  sha256 "cd5e613affb6145bdd47104a026428b75b88dea57ae74e4abb69c7e256e51fb7"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.24"
    sha256 cellar: :any, arm64_linux: "c190e00fed39df09b15aca1be99ece9466b31779663cc2353f6f7b80dfa92499"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "46fee9181833d04934969b8a89b5f4ec8ef7be7de268e97a6b4f7aa0fe60fe2b"
    sha256 cellar: :any_skip_relocation, sequoia: "a65a831ac9877bbf177932da9379ffb46ca572c6f29ba27ecf0cdf111eb124b9"
    sha256 cellar: :any, x86_64_linux: "054ced4b92621f865f3c7cb1ed0aeafb81574ec5e0384f61662f54dbeb91b1f5"
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
