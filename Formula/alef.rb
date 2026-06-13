# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.24.17.tar.gz"
  sha256 "93a0f66b2a1178403472309e1b242f53d6cf8c7d9fbd4446319f6dbc96c78322"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.24.16"
    sha256 cellar: :any, arm64_linux: "0105fd584e97b8a26aafb06c220dd47ee8468f87b5038a2fbaafb343ac51a076"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d43291d04c359cf518d3fe8f1423c38dd68f14fc209465268aff68d6658c66ee"
    sha256 cellar: :any_skip_relocation, sequoia: "5d6c7b88c7361e4eab14bb04c9da067f6e1028328c79fa2fc968ba32d4def490"
    sha256 cellar: :any, x86_64_linux: "8ef870125b19b97838d6fe13f7be6fc799853538b8760a0a51a8280648415bff"
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
