# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 170+ parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.1.2.tar.gz"
  sha256 "8d3f1b1e444020bdc1a949f5b3735b10b89b136169b1b9d6910d2e1d25aeecb4"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a9ca80f20e199bce3c1ce9128f5888c4b17c5d949172c3c5b7b6242354ded33b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
