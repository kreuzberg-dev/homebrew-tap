# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.30.8.tar.gz"
  sha256 "e706c358ff6d24bb430d0e92f84e0d4514116e3b3162fd8d6472d599b49e9a67"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.30.7"
    sha256 cellar: :any, arm64_linux: "6b2e7977b6fac5052ba07e1d5812b0e82a34de62ffd9a9e9d64216d9044dbd65"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0728d125460c39f9cd61a4b312dc779c068efa90e2a4299172799df52e2b11ea"
    sha256 cellar: :any_skip_relocation, sequoia: "1b84422c7745fd07f8105056f76803aacf3cd9d5c67bcec81464d5b0df3f0e75"
    sha256 cellar: :any, x86_64_linux: "998c30046cd71f74cb0ce5af62502997b5dc2297a3c06d2150d3578593dc3ffe"
  end

  head 'https://github.com/xberg-io/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
