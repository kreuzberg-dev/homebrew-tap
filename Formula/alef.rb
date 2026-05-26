# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.19.19.tar.gz"
  sha256 "74806377659c1e00ce6402384719e54a46c4371cf7fe3e489a3fcb7064919453"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.19.19"
    sha256 cellar: :any_skip_relocation, arm64_linux: "8852c90a0bf97a703ab9445825fad6bb94cdfe7b97f59f3eabaf09fac5433fcf"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "141c9b30c332ce5e12138dddce050692f4929735fe76f7852575b865bb4fb80f"
    sha256 cellar: :any_skip_relocation, sequoia: "279578be9a275830991780908de5663b305afad0aa3968ac36f8ce87c96e8aef"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8babc1b3a944035890704a40d7dc95203eb9bc64da46a892b51169c55977b7b7"
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
