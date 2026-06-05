# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.14.tar.gz"
  sha256 "0ca00b3007b5bc446a5f407d16d92936c805a30990773db86241ee617cae6e6c"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.13"
    sha256 cellar: :any, arm64_linux: "dbc2edadfea86905a970c15b61892af63e255bcd8bdb0f2b6442930550ef1834"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "64719442f1f310d61f6785d091956a4727f34c7c6499f1232c37ed22ce7eaf67"
    sha256 cellar: :any_skip_relocation, sequoia: "7cce370722969ea0c6596d5e625159d21185ffc641bf016cb55bcc610f0fd8dc"
    sha256 cellar: :any, x86_64_linux: "4ccde59079b5470c3e39a0f22312b37ddd1cf4689f4ddfce787287f4ac228e59"
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
