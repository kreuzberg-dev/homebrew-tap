# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.26.7.tar.gz"
  sha256 "9b505654b197c4e17079aca9e82874ee64609404a40dd83367a98c78a4d6bfbd"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.26.6"
    sha256 cellar: :any, arm64_linux: "917df5889905443e9f0fa2ae6368bc98640288f866992283a0794c9c14ab9c8c"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "fd0b447a16c652033abe20fb52b7568891b2538dbce63a0d334eef30a1e41a7b"
    sha256 cellar: :any_skip_relocation, sequoia: "805a63c32d7f85a9c01d2e0462fe142f7cd144e1a3ab456c68e6973d64040728"
    sha256 cellar: :any, x86_64_linux: "4d3fc960d9a3e994f9d6066b6f78c234ffe0a3042e43d08385b9d1751f3fd00d"
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
