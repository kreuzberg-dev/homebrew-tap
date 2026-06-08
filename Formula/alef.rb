# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.50.tar.gz"
  sha256 "da82eb5ac52990c2644062a5e9176a908819dc4819fe9c705220dbc07d75bf16"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.50"
    sha256 cellar: :any, arm64_linux: "f834f7afae6dac732dd62cf636137d502b1ae92b46fdee799df2dd6cf3ceca6c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e9b8fa36468159ebf0a36b0711184c0085b8d24b4d9537e373b1a2cdcc1c6815"
    sha256 cellar: :any_skip_relocation, sequoia: "e1542f3a20b7d5dc118ae1dcc50e15c964fcc8c89bea2c2fb660c753beba200a"
    sha256 cellar: :any, x86_64_linux: "9fadaa49c6a1ab770d9a53e690755c2cb6bd572c8294fc575e679b5b937e46d0"
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
