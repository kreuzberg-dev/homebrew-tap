# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.76.tar.gz"
  sha256 "475596ef2dea62b1591900fc38985e94a13785e535773b079f4e1898e3b35508"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.74"
    sha256 cellar: :any, arm64_linux: "cc97313e172ab7c0d3723d66418f043f46d5ca18b132b8f365efa082caf665fa"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f6a9182ade55f3c97e1ff540e656d1d45181d8eff50369dfd36861f2c2cb160a"
    sha256 cellar: :any_skip_relocation, sequoia: "19d858ab8710afc31e4375f4bb1b2a2ac8292325636cd7dcf1ecff582e744cd5"
    sha256 cellar: :any, x86_64_linux: "9775e6b11b79ed36877385e14bdca34af351928db3eeffdfe6b202cd4991f5eb"
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
