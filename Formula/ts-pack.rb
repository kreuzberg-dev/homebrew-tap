# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 170+ parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.6.1.tar.gz"
  sha256 "2f40476f914a987f8f244db1e119b5cc6466e3313bbe88209be454f00aa32149"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.6.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5b8241ca4a99235defe48760df241c9d2610593cd93d919e45bb327a42f95c4e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
