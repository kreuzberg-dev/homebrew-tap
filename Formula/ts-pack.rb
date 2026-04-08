# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 170+ parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.5.0.tar.gz"
  sha256 "ea8a44f5e0421dfc23b8c775955229cde0c836f97924dc3d30801432da664660"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c9cbb7fe0a1b9e302820dfb760f1164de0bd7227e06fad61906ba04cf4edb790"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
