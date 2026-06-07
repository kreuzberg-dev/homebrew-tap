# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.25.tar.gz"
  sha256 "25ec412535148dd5ebd3c9f02ce7a7a495164151eb3d8468d354188942be3328"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.25"
    sha256 cellar: :any, arm64_linux: "1a63c4435865bc192e04ce095f7e4d9d3f08c1f74e6fa85f281e697c95ae62b1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a770582f5835cd9b0b4ccc92caa93790c5552fa76c1417ea29afa83dd202f66b"
    sha256 cellar: :any_skip_relocation, sequoia: "0a4b498f63167cf1e399f4e20ccc0f54c93d6b030ece6a650e1bade19da749fe"
    sha256 cellar: :any, x86_64_linux: "f6f29522de8c70369eb5a12dcb10f1df7a5da5e8781ab0873f132acbd21a4cef"
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
