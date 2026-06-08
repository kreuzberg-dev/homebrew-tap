# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.41.tar.gz"
  sha256 "7772672c988603ddc0d432493fc81f14ef07c4dc3dc3284a8837fa79c62df144"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.41"
    sha256 cellar: :any, arm64_linux: "2c8719a654e431fda6cb1412fca9bb19e5b45a500e2344612bc058b1cf6f97e4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f7f1247c49688ad8383b0e17a667b220d49122fc79607d7058a85ecd8f77298b"
    sha256 cellar: :any_skip_relocation, sequoia: "f8201ff6d25384e7d370b789ff1597336b4214a27ff693326c042e1bce4ada8e"
    sha256 cellar: :any, x86_64_linux: "bca220330028b5d4c5d51b633a06ff7f9cc38b362b7bab7b4696495a290b75b9"
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
