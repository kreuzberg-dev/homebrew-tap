# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.22.33.tar.gz"
  sha256 "1d4b7c27db35d979c7e1514ef7788847fc2086db445c587fea2b07b4a10fecb9"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.22.28"
    sha256 cellar: :any, arm64_linux: "6c2f0c8e2d735069df4a6d21900a312e2e3152f28e99955a15a882d3a29b2674"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d1cad8c745841a4bb9c8ef1a68035c0907e90b1135b873fe0129eadba444b126"
    sha256 cellar: :any_skip_relocation, sequoia: "9e2a3ed4835b40c602b5ca6badb5abda0417eda69eaf1b7b53bae90e2f06d3d5"
    sha256 cellar: :any, x86_64_linux: "a9542618c1916ae31475b9e6497da075df4e96fb6e04392bfbb3bcef8caef079"
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
