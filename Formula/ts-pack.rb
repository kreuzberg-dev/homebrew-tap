# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "35032c94f505005ced497d5ad3b6d18fddc1ecb938c33cea62da240fdf6c5e1f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "10d3838f9728156ecb8c663a7f75e50f720ee29758e4133e56c2d672c0ad4b1a"
    sha256 cellar: :any_skip_relocation, sequoia: "913f3bf3b0d18dc4772384cc0cea65d0d2e9af9837157d82f96abbca17f7b1d8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "900908296f5f5462506c17f78b7fc0dd41d286fdfa6206c4d25b0c84025f5c4c"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "077d11e5cfd2339e716b30fdc18a49eb3f7f8c9314e2868e7e4e0db7a50402f4"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "dca74cb5187cacbb0c7e38a4ec2f709a2fbbbe4e91ed345440e52c2145071223"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "a0c31b6e2555add017adeea499eccaa755c4664af1f3ed3fd798cf234993289b"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "d01ffd4bd8205bf7fd6fb761895658ee5ce2a0bf8ecae27f0701e76014f57a52"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
