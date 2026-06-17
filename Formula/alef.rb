# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.34.tar.gz"
  sha256 "4cc56c9eeaa551697601cb324c658c2e3812fe87198db9ea9f7e131bbf8add6b"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.34"
    sha256 cellar: :any, arm64_linux: "32a43a0fc753af0c1c603c3e9d72f9cc1d90541a5fa4491c67deb0099d2fdf98"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6ea16480d6f3645832295cd79ade6a1532d46c588798176d75d9729c404852b9"
    sha256 cellar: :any_skip_relocation, sequoia: "e05612e9b43632d8838cae89311f6d27a08155e5f64316805a27b149a62161b8"
    sha256 cellar: :any, x86_64_linux: "29740d01e3120013711faa2ad139c76b4e4e754e2c4089e02f0842f03492f254"
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
