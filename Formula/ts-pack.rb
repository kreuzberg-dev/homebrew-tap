# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 170+ parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.3.1.tar.gz"
  sha256 "97b636bb011423ffc632ddf4744ce9b6605f3c95566a0bdff04c117ba6d7ac6b"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.3.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "386ac102708f158faefd397effc6c9036e9d083c6e2d0c969256dc5a372d4d48"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
