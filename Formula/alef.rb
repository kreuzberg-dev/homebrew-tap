# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.56.tar.gz"
  sha256 "d8995828cac1bb531a4ff6cd55eabb30b69fcce0655302fe469bfa8f0834d559"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.55"
    sha256 cellar: :any, arm64_linux: "353f77f3931b670643da4491617afe8f73bd3714ade7e407058673b4c67f4a61"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ecfe0732778db00c3d6a46dd0fee47aa7d37196581a41a36a0efb8cc81a1440a"
    sha256 cellar: :any_skip_relocation, sequoia: "73d26b8ec25460d990ba7ee46a335787f9cb92a5ee637616432ab0645822ab53"
    sha256 cellar: :any, x86_64_linux: "383d2892d19e7d7abadca2d24be781e0bdc6e47ca05b39ef2620fca0c5bbe43b"
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
