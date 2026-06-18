# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.44.tar.gz"
  sha256 "1028c64a9330e3cda55389b071d709efb87c60dd9b77f64f8381beb2335a4c38"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.43"
    sha256 cellar: :any, arm64_linux: "0fb380403bca9ccd3fa3e1127d8a66a48be6cd87cb49638e6535439a8fd1b7f1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "dd5c533a6bbf80bedd6cfa8cf8d3de70246560448bcbf22bad0fe2f0a8d37afe"
    sha256 cellar: :any_skip_relocation, sequoia: "7a51b8bcf9e4c4693dd394332fa825b99d84df8af11bdb7a7f6b250f131f9baf"
    sha256 cellar: :any, x86_64_linux: "3521f30b193ac148bb5772a21171c5a2481349f138eda8146b178210d91feed7"
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
