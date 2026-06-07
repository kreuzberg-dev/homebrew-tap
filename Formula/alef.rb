# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.31.tar.gz"
  sha256 "f6fd23508931660be2a9bdec61b0acb02e81fe3b294c4d0c3c11f127d56b858a"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.31"
    sha256 cellar: :any, arm64_linux: "1cdc69c1743a7664d91541b0897f350bdd543aa3f4cce3875184de4066c6e719"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9db1246889d2a37d5b93c90e724aa506c5352f01927cd9b6024ad7382cc5cf4a"
    sha256 cellar: :any_skip_relocation, sequoia: "f27ba9cfcf272e11710fb0922b9e1d92afe9bebf2e3429f60ed6704a7773bdad"
    sha256 cellar: :any, x86_64_linux: "34453cd20a2396ef21337f038cb571852f7f33eada447d58a7777e4a02601db7"
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
