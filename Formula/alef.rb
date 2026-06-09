# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.52.tar.gz"
  sha256 "dec8c577412801cee98564f27c7d4a0d0f0e6481cd8bc772e3b8049ae37f2a9e"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.51"
    sha256 cellar: :any, arm64_linux: "a71636ddec60f85a90f5517fb6d8b7a7736320296a2512345a1d6fad0ec13a0a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "29b78e7ac41ddd502eb764f24692e206348dbf039bbeac8bdc8075f58c4a2f7b"
    sha256 cellar: :any_skip_relocation, sequoia: "62d4e42d9c0cb1e9dab66dafbb153c5aa671d3a39e6b84da5a869a4708409c18"
    sha256 cellar: :any, x86_64_linux: "6c12dddd63144c34b721666696b98fa745c143431cbdeba616a76988b287ad0e"
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
