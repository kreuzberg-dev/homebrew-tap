# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.22.22.tar.gz"
  sha256 "3f305188b41edc5316f2fc298633112ba46e6bbf88d26f2b58a14ea338b7fcba"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.22.20"
    sha256 cellar: :any, arm64_linux: "a99fb5a845a4dd08a020b7c65830c68bbb15c5670a68e4038985b28708eb3692"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "60167d2d536e293bd305c27ef3aedc3694b943b61f6b85779968cd38e1421690"
    sha256 cellar: :any_skip_relocation, sequoia: "7663125eefa30e0377bade70fade0332955753610aa7b4b9cbbd8b4f8b8ee600"
    sha256 cellar: :any, x86_64_linux: "5de261e0711e8c8676db48af11002e10cc711fff84032a174556187c2df44bb5"
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
