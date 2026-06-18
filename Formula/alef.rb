# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.42.tar.gz"
  sha256 "db924f8954b6f450fd2e76c976810a09793c40dde626daa3be6588b0eb9a5d89"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.41"
    sha256 cellar: :any, arm64_linux: "9cb806fb619d06651217255f2886b6f8f7739efeb603b54298508423d82adf47"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1fb89c4b1a9de14095f073ff7a09c2385904c360b517d496741f1543da7e7770"
    sha256 cellar: :any_skip_relocation, sequoia: "7c0b1210690f82a824111bcb68577f00e84646f16ac573c79f77fba39c399a19"
    sha256 cellar: :any, x86_64_linux: "567d9960dd08f5dcf8dcb4487c03fb2e4aa77b203128281af77b0a880cdc8a7d"
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
