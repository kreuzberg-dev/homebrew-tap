# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.19.23.tar.gz"
  sha256 "120df7cafc95c62927d06809bbf67f149895b81713b136e6e248cac9d6ff2175"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.19.23"
    sha256 cellar: :any_skip_relocation, arm64_linux: "e1d53d8b2fece5424fccbc67a70790077c5d8800ba6f7c526619ccaf6057c10a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f6c7b7c94762d75fbc81f8962e8932c7e976579759858b4a3b5e784daeca2829"
    sha256 cellar: :any_skip_relocation, sequoia: "6db5427a189075d3108c8a63db0b114b342ba25d7115838ac380ed6db550f29c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "808c344f522be73344d466868721379ca7e78e825f15400965f3f2743b17f13c"
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
