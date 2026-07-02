# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.30.5.tar.gz"
  sha256 "cb503223e04245c6b0f6842874879c361f3798cc3a45fe542d59de78fb0b5a0a"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.30.4"
    sha256 cellar: :any, arm64_linux: "de032702599e0ce2286cf213cf642cf9d023737a0075147a811d600882b03807"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2827b131283af39c3faea58ae6fe79c6f02196ba04f0c70f30091426d754e677"
    sha256 cellar: :any_skip_relocation, sequoia: "eaa9e91b0943603649e7f249504a4b085449f7dced3f6200a7d09b92c1327047"
    sha256 cellar: :any, x86_64_linux: "9431a84b4c7cbc33b43c2521e0861d7a383338ca39b32ce6bf476db49770343e"
  end

  head 'https://github.com/xberg-io/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
