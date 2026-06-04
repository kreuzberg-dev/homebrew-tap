# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.22.25.tar.gz"
  sha256 "23f5cef6f03097ff0dfd82af59cd10f14dedf5817490d43fbafc0c91a615f73f"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.22.24"
    sha256 cellar: :any, arm64_linux: "547a5135cc1104d4bad3c10eaf1f1df28d4f8e5ae86432f6f0582b4b27804490"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bfdfaad18945278f6d31799d7aa440161bcae94d6a60f887570e6b0dd88d3f75"
    sha256 cellar: :any_skip_relocation, sequoia: "04d66df0e897822fd5f8b5e3e8144bd4ade9296fc5fece1af40f0f050df94f87"
    sha256 cellar: :any, x86_64_linux: "260e465caf4b29acb4bf07c6df188f76de178c8485910a8f6477ea749b6ac146"
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
