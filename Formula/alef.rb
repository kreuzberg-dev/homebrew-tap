# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.54.tar.gz"
  sha256 "ff48513d3565e21670c9103b7ecde5913c2edd81d225348c9cdae7f3af22764f"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.53"
    sha256 cellar: :any, arm64_linux: "833c19243d2d310737dfe52f38f20b4c304bf78d739b1121fb4fd3004e8dedd2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cb542fbaadd00733cc664a8b65319ce21c9f6693b73d9f291910aad09288400e"
    sha256 cellar: :any_skip_relocation, sequoia: "fc549e802ea7d9180c7b300aaee3147d6fc179bc10d1b815453c0a93582110cc"
    sha256 cellar: :any, x86_64_linux: "5e8bd701b8387c7f9567159a9b52ba9d2b072c439b92776da1cd89c942b7319b"
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
