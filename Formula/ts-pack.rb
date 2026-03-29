# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 170+ parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.4.0.tar.gz"
  sha256 "8f88f83ca2e562141ee8f8a82e375ab33d06f51e7c14620d9b0c4f0d3077a552"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6a8e32d6c393b9ccca925a98ec692731fb9585cf145a178969d12a9d9c9d75b4"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
