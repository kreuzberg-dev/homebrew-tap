# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.24.13.tar.gz"
  sha256 "ba6fdafa20cb4d299039cf8af24952e17cb92de2d0bbdbf65c87fa451d3152ee"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.24.12"
    sha256 cellar: :any, arm64_linux: "c4a44131f82a5867ccf7ef72b29dd3ba3c153762a19d6829254b5a60c6efb7e8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0aaa72fe39cd83e0bfad991ccb3f5246dc695d835cf1564d9033db71f0745f68"
    sha256 cellar: :any_skip_relocation, sequoia: "e8ea62934ea0e85b0aaa32949f878c10b0ce48ef78777ed76698efc6fbc632c0"
    sha256 cellar: :any, x86_64_linux: "5d3b24c0a97b69f003c3fe29c97b646a5c880f109f448db975ab3e1d9f447f11"
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
