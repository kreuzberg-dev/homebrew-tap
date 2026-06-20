# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.51.tar.gz"
  sha256 "b2c9208c47b2bdedf51934267507b86b8a8d4e033585915d3cb45af11000a240"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.50"
    sha256 cellar: :any, arm64_linux: "0681e141ee65664f02d38c7a665bd35072eb54d9d2a049e5f6f80ca1a9c485a0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "91fd3273aa65a65ddd2ca0be588cb7e2670b1aab6401b4a48cce4a2492ad4a9c"
    sha256 cellar: :any_skip_relocation, sequoia: "99ac5a0ae4f7d52214128e5a496c5ab4cceb2c6d7bb8ace0de5ae10934bcca34"
    sha256 cellar: :any, x86_64_linux: "880e2eee6fc4d07ea9f0bab49162754f40da97f6a1f98d67c9b9cb1c200fa842"
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
