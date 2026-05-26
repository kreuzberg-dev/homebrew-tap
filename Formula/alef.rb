# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.19.14.tar.gz"
  sha256 "cc3f3b21c2bf3d8645475d6390400c7cd36db86d0b95432f97e9fb7487bdb5a6"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.19.14"
    sha256 cellar: :any_skip_relocation, arm64_linux: "c0ec0809a86458857d2f665a7f95cf146495646cce99ceab71d5c92a936ea7eb"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b58ca05200d9acbe2048cf5eeeaeca481e9d7f9abffd33d23bf6af02e3b39193"
    sha256 cellar: :any_skip_relocation, sequoia: "d6c2008ed291b661be2fe7f01f61f459635427c6889ee1a3ba3998f69b56fe11"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "390a5a7f8665992de068b3266779c1e4908d367a64bf9e99c44a4d51b24ef5cc"
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
