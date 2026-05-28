# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.20.7.tar.gz"
  sha256 "654fdaf8486d8cd7c03c142e2f2eee52a3dbd07855780cff118938abae9f7151"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.20.6"
    sha256 cellar: :any_skip_relocation, arm64_linux: "9e67766a577b0811702a28c6cf985028f35eab973eb404d34acbefd76c9b1553"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "526ec334050f6e99fa66751d2d59fbb4307bea838fd5c4ec232cc490e49bab02"
    sha256 cellar: :any_skip_relocation, sequoia: "c67d742d884ba2c6b09c69248771a1ae7c7bb58c6420eba30dc47bcc52a7c56b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0003c9b3229ff95259ba0f1610f2fbafb17ba8c137282296689a91d571b8dd97"
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
