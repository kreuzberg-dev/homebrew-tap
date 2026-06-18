# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.41.tar.gz"
  sha256 "0d498e8b27f241e403e78c79ebabd869f2f96d681ff6b988fd43ce2083d37785"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.40"
    sha256 cellar: :any, arm64_linux: "bd24b67316c5c80b5a7d53671b9242c55940a9bdafd536d91e54281b8cb3e77b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5b3ac63ea238e4d20839853a8720e3cc3358a05e0aeeeda9b6d9fb386db95e40"
    sha256 cellar: :any_skip_relocation, sequoia: "252593440e2ad4bef6676ecb26bd48cfaf78134286d991c3cd329a8bf62d995c"
    sha256 cellar: :any, x86_64_linux: "a24466bb52196c2fce5b4665bcb1be27d625066616274b44c589a25556e7e00e"
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
