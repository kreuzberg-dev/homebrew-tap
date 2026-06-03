# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.22.19.tar.gz"
  sha256 "427a318be290faea5a141ab0dd96d6f272671ba74b0c2ab8e261508f066e916a"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.22.18"
    sha256 cellar: :any, arm64_linux: "ab6724802753655a331fbf1945c1e70f7f96a098672dc012604b075f6ee8c993"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1dc38e833212613e3b3a67ca11f4a5f8b8f0c31ee42102241c79c840f4c0a2ca"
    sha256 cellar: :any_skip_relocation, sequoia: "b9baaa9da7d5e43977414504a16a0085b55382d89cdee94690c0d57f2a93bb40"
    sha256 cellar: :any, x86_64_linux: "ed92c5cd89a44e453ce83f0a7bed2b8b98601a95cfd1534989cabd128e8b335f"
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
