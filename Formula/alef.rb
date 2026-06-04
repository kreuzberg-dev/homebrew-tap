# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.22.26.tar.gz"
  sha256 "da605c9512f58b236990b54381436edca8b5e7becea32fb3eef8df7ef810030b"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.22.25"
    sha256 cellar: :any, arm64_linux: "33193790685d3c6bda80b45c790921cca61af677a3cf328b95ec4c8baf6fa8ce"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e2ca804d5c75e30f1de606ba66080f698f932f75ec4ce1fed62b6413411f1273"
    sha256 cellar: :any_skip_relocation, sequoia: "cd5cac2a8d9368389e8a04e430d8e9adb7fc0414a8f8d1ea98adfb87f65f2da6"
    sha256 cellar: :any, x86_64_linux: "0991b5fae6ac282c20179e311b3f15d0bcf4939c8ef1cfa3ec0c80576a3cb3da"
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
