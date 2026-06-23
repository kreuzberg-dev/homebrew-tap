# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.26.5.tar.gz"
  sha256 "ae1ebe4b84a4ed1cc155643b6df690ce65860670c8a6a483864871c074122a20"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.26.4"
    sha256 cellar: :any, arm64_linux: "948d36615a1940f33346f5cc3f9447f1d02fcf680db1664e2a0aefe1b481a286"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "df127b9a779f650644475aa56ac3cb95fb4a8c8eab47ab83c0f581b50f5969a2"
    sha256 cellar: :any_skip_relocation, sequoia: "c0bf896808b1c2eacb35b99f53b980b36855da2f2125b450d228ef999fdf908c"
    sha256 cellar: :any, x86_64_linux: "49bf99eae7977a67b0f7d13427492435e15dd79da0dd16c2083d585177a5310c"
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
