# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.17.tar.gz"
  sha256 "5cf9270a9149c86abd4d41cd88c9f414b5a8666440e3c381942c75287451c790"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.17"
    sha256 cellar: :any, arm64_linux: "29a9a8f61790621a91a7a2f75c0ca9edaa077047d4f8dc7fb6a9fe91bcaf55d1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "81e6f71c70e9bd06076ef88a5ffa4513e96ad82ec0ffa6e346604bf636a4ccd4"
    sha256 cellar: :any_skip_relocation, sequoia: "2b4fd8a6f0b3ccb5d720be5e6301acb86aa76351a4627decd7ec1a99ce61a5fa"
    sha256 cellar: :any, x86_64_linux: "fe8ddf5c6f4c12882f843572560844672e967f59e684ad471b6307280f2ab442"
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
