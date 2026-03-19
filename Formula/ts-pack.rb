# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 170+ parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.0.0-rc.13.tar.gz"
  sha256 "d45a9904fe514ef7ed9840a34b63a48ce3dcb2e101ce407f3a5765bdb5110e9b"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.0.0-rc.13"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "39ec32baf4d3e48a87544606aeee8239f1ae3e7b8ed2a841cf8f6c5e362406ba"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
