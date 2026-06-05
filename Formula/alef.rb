# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.14.tar.gz"
  sha256 "0ca00b3007b5bc446a5f407d16d92936c805a30990773db86241ee617cae6e6c"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.14"
    sha256 cellar: :any, arm64_linux: "5c3108a067f71aba9f47dc35d77e23af1904d64d810617deb242ce38da2edd5e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "19b08251103758f75ad54b330bb5bf49ffe5083e19ab4bc329450cc6ce675aa1"
    sha256 cellar: :any_skip_relocation, sequoia: "a20267cc35b5aec00aa76dd03c0e6b669c7a40d98a12f51c1a2e84505d98e002"
    sha256 cellar: :any, x86_64_linux: "8502138a3f705002168e0fc5fb57215e17ada671fccb0c35847098fb09ba12ab"
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
