# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.20"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.20"
    sha256 cellar: :any_skip_relocation, arm64_linux: "32c5cd6e81f976f728d97aa00fefb26125fef4b63c013923f74579bdb6482b04"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b8c5f2cefe4877953d6fbe59198b4f10fcaf919565d4f170205e80ca01a419f6"
    sha256 cellar: :any_skip_relocation, sequoia: "3c00a30fe202c6a2110bd112b9e8bd6e2b5355d520f693613851a47582ef6c2b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "eb02966b471c3a3e306d04f1b61a193e3785ce79d01b22ef008de93aa41b9b41"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "286c05777839af5680307c0d592e26562b39074cc330f3b6b547ba8e252b773b"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "825248ffdac42bce821eb01c9603ca45e9d616b9e4487280e57be88a9458c12f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "501752e4af4af96e3680c33967c2a32318d517e02145cd58a8a23160eb711d4f"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "d90dbac984095367997666f2d2332f55fe4876a9df0c2afd91ae95098c791f38"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
