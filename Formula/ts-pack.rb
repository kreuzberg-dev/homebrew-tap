# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.11.0"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.11.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "c71ddee01a917b10b071ec5dc8072ac3f822304c6361093bcd7310a8e4c233f8"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "399269899bcfff8f64912a0b06bbfbf367b7fd808d89eef5252e67f85aa1ef2e"
    sha256 cellar: :any_skip_relocation, sequoia: "8adb5cff86cc9e0c4a941d1ca6d7d508c0389df8b60d99e9b50d9ab6b77ce038"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9047513e8e27373b867ad66bc8d509b22dc02e5c44999b58c97bd7084449d9ed"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "2d80fa72965f89eefc2f8aba78fcc56009ff2e26406972de7de18f3f25f02ad4"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "fc629c5246a270926b8bdeb5c709af20ce4fc0011627c6e91bfdf2678648ddea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "582d7610f2880acb183e59be6974114eb4f26eacf10bb93d3b45b7e27c8a4f14"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "96bd485bc2d4e5ac12cbf3422e292e60fe08f3e88f9626722cdee0bcf9563934"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
