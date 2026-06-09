# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.57.tar.gz"
  sha256 "66533a27794eb8b83f00b3ce700c47c9b6a3814304dc5dd1158a1dfb418ead8d"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.56"
    sha256 cellar: :any, arm64_linux: "8cd4379b76bce573e2242e914dfc04eb4baa33e6774de0214ece6d633d7d7b84"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3d2f9397c138fc4fcc249b8d139802a4adf3cbd4f53f88d1a64cbd14c9c2b9e8"
    sha256 cellar: :any_skip_relocation, sequoia: "f57c70fb52faf4296652ad3eea2dc61201c37b2019960249d818eca06d3f7a10"
    sha256 cellar: :any, x86_64_linux: "4b456b26123eb966f3e5b8ada119a8958307e5ad105b356e4c0d599d68a088c3"
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
