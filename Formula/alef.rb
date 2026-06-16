# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.23.tar.gz"
  sha256 "f21ebfd801bd5bec30d76be3c1b95e3c4e9f8f5c6abd4311b505658ccf3cbbbd"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.23"
    sha256 cellar: :any, arm64_linux: "1b62643aa0104d9748b4a5612d92c402bf4765b5f3ec55231f7ac4e2c4761625"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "766bc6011457ebc146ef8bdf7301d4185e936b4e393b8498b256ee85c05e35a2"
    sha256 cellar: :any_skip_relocation, sequoia: "6e9e85568c3484ab70552ae99c1d7af7774ec110db7e6b8b5f382e0e608572d6"
    sha256 cellar: :any, x86_64_linux: "7f3bf9a9a2392e9b0dd0dab0edca15a98e72171f7ac77fe89dad22eab156cd99"
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
