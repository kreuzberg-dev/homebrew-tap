# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.27.tar.gz"
  sha256 "25190a69b05e23215bd016faa82cff19a63ae26ae58a34f023f8ac03049ef833"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.26"
    sha256 cellar: :any, arm64_linux: "790b5933665bb5eb23f44041a08b05b86fe14d45c0f126e3b35aa124f6a7bd19"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "02d5e9baebc98cddb9797094af04a3c4b0083ac8d143b7544339295b69980faa"
    sha256 cellar: :any_skip_relocation, sequoia: "4f3f421aeea46aeaec76ce5f7c172036899b64b49c5e56418b49e4f505befcb2"
    sha256 cellar: :any, x86_64_linux: "cf75477f5fe74567eb2c39713706c094fcb1512840075f0656fb7ba2055a0e5d"
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
