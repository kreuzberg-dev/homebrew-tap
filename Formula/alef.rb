# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.19.12.tar.gz"
  sha256 "a0c19df8ed1fd5a9a0a99e2cd3c2c3a4b76a5125a51d603b90481922bbd2d23e"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.19.12"
    sha256 cellar: :any_skip_relocation, arm64_linux: "95a5f296dbe3f06be23efe70991015172aae346204625ab8830d66d158c95c16"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1fdf4f87e2905e81eb6d8bb1483011f26aa35fc36b3b673944625b64a383ab8a"
    sha256 cellar: :any_skip_relocation, sequoia: "65bfbeb4616b2dbeb02f8697e049dc26f1f813b57c7183078487bbb511f901d8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d57e97a831b0d546312cdc1407893380059e8876da5844610ba65d74ad1ade44"
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
