# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.55"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.55"
    sha256 cellar: :any_skip_relocation, arm64_linux: "73fadf7a00bcea152a242799248a90a7525e1cca6da5c934a17bc492ae73a841"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f87e0e599f3fe47b6adba81d0c17370b10a4a3fd9a7d0e9d435db6274872b9ab"
    sha256 cellar: :any_skip_relocation, sequoia: "947d31bfe0b5c98cb65b56430cb30ba765ae1d555783dcd881c9d5e97eca3da9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "02fb9231c1bea8df1ae285624205b3ed49ca471e44cf3a8478595caa17263fe3"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "0ee71345ff70b26f170eb0d11079892c943d5d35c5ca6b0f029958fc6a9cb50f"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "8d176f6c69cac8f162d3a5a647bee048bc68adde9a047d9a4a6c130028a0ad21"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "79a5b8e673611ca3348833aabf79d06a5768b27798e3fcb0493e8bd62a50529b"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "d8c70413445b498af3222507cd8aaa700d923111e4c6a560bef8485b569d1613"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
