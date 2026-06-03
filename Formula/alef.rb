# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.22.23.tar.gz"
  sha256 "1049ec88f7cf894fcfcdfd624b5c90417874b8719946ff85de7140e04f3bf6d8"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.22.22"
    sha256 cellar: :any, arm64_linux: "c0c2656b6ed8365687acb0ebfe89f18b2a34b5210bc8504c42d93728bbb39de0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8fb3ddf55c62feb7d172fe346ffd52b0fcf8bb3aac4224d9906cbd102936869e"
    sha256 cellar: :any_skip_relocation, sequoia: "6bd81a65df259c48e51cc17c714599de2f8bbe91173f9b2181fd8f13ea7aaadf"
    sha256 cellar: :any, x86_64_linux: "5d58bcdda257f2c836bbb72c65cb113d9be91ef2566539109d50675773d0e024"
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
