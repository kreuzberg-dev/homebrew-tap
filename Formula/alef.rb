# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.19.22.tar.gz"
  sha256 "181037442f50caf5ea9ab433b462ce3e6d48d0b2dffbb8d39c75e855a64c2692"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.19.20"
    sha256 cellar: :any_skip_relocation, arm64_linux: "30d8a59e5c0b852ec53f5f9d8c2a895f9eaa9396f91fd33991b804e6500d4816"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7663f22cabad381c2766941b972489d3a3a2c0ea2283846c09a652ab1c7aa72d"
    sha256 cellar: :any_skip_relocation, sequoia: "53a8416cc7582b3b8a684ead83ee44e9f599340f01c52bda03a67d1d8a99e50e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1940c96b7cde5a22ddac54feeda3c2c1536f51dbe4f2e96ee69abf8143007729"
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
