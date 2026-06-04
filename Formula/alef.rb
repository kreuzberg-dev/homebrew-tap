# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.22.33.tar.gz"
  sha256 "1d4b7c27db35d979c7e1514ef7788847fc2086db445c587fea2b07b4a10fecb9"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.22.33"
    sha256 cellar: :any, arm64_linux: "7cdea695ed87b68b979807eec06d57f0f2bcf901846f80d4b23ca060c891dcf9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "78aebd533580ca6d7c8c435a1f26f1c93f96a0702caf485e8ace6e925ccb4305"
    sha256 cellar: :any_skip_relocation, sequoia: "12500c91cfc40bd648d273e47a3822be140dc1fca7725661ff60d7d0cb536f36"
    sha256 cellar: :any, x86_64_linux: "5cefc43a9e21f788b42ec7a6ea94b747da3449e9abdd62efadad3ebc08618ad9"
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
