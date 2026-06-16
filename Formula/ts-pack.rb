# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.52"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.52"
    sha256 cellar: :any_skip_relocation, arm64_linux: "dedaf429bae2b200da948aabaff5b1f44f6d3d65ad733c2ca058131a47f53eb7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "afcab1b8e7be68a65b3ed49824d16015df0ef279e7d926cd9f00395fbe20066f"
    sha256 cellar: :any_skip_relocation, sequoia: "e1cc005307f358993e5988437b93f296935e879925942c861e4ac328a0bcf009"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "51b2921f4d37cf52c8440751ce60d13240a8bcd9a2f97b44c5e92780028363b6"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "f60c64c5cf402f78966e74f8539fcc6df6ae26d992d599e26acfd4808cbddfc6"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "401df6cdaa47347b56a4ab6b8b51ff86f3f7b9c3b594b6bd99da3e3d4b1abab9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "6b4df2b77cc795a4c50f0eac019da87162c92e0b37fc9196a2423fc83163db1a"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "ab914d61056fe59be31eef4d945ed8479bc526e86b2067388395655e17a2c532"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
