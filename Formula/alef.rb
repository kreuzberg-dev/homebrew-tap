# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.17.tar.gz"
  sha256 "5cf9270a9149c86abd4d41cd88c9f414b5a8666440e3c381942c75287451c790"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.16"
    sha256 cellar: :any, arm64_linux: "37df0a0e2ddd1bbe00d954b4c95c1871d68991504c947a303be9343faa708fcd"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "75b42558da5a26c24fe1f8d820bc645d329b11850c6c0f6294bb0d6d92278aec"
    sha256 cellar: :any_skip_relocation, sequoia: "f46249d0298ccfcf577fbbe08cd56c53b7083e5efac4fa7039f1710282ce4bbf"
    sha256 cellar: :any, x86_64_linux: "badc70fc16b477fa07db283d555b0f679d49befdd18669122f389e04df454dad"
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
