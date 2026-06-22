# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.26.4.tar.gz"
  sha256 "6f12f4f7bc8d574b013db202548ca5328b5c649726a33a1e75edcb40272bd623"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.26.2"
    sha256 cellar: :any, arm64_linux: "a16619101bfbda5651e891948693ca99cd18f65ec46f73fc0638246f3b307b67"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "de3c1afa15f3c1caad308709489bda5b76b95265648d327027194e1087330727"
    sha256 cellar: :any_skip_relocation, sequoia: "4aa8347fced3b5d7e3e63c53b9030d8d54bda9a78d455a18fdf2519f2318df62"
    sha256 cellar: :any, x86_64_linux: "98fa499406c79c1957c5267950eaa8bf906b90793aa716ee7918004ba9fe7259"
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
