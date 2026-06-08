# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.48.tar.gz"
  sha256 "322c32a8deb3cca8a695fc5fdcd38ba392ebf7f223a80d04a75f6de23ece3671"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.47"
    sha256 cellar: :any, arm64_linux: "21586e8c215f7c00c56a2a9aad69f73d3a2d430d408de0f8f07a9ca15c67879a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7b5ea7d7677f26c7d20723f58bbaaa8d2e5982ce01672d5a82cfa95f6742cfc3"
    sha256 cellar: :any_skip_relocation, sequoia: "c1d4725f84664ff7e8f5f7dd6111b5b13c4d357de37703b2edf8143ca428ecb1"
    sha256 cellar: :any, x86_64_linux: "f79025def2052ac3c35690e808fd5d11aabe7829ac2ac30627742bbed8652829"
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
