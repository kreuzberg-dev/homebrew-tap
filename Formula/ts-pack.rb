# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 170+ parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.1.0.tar.gz"
  sha256 "f8b582d5c3e8db87a103cb01c95e6ec53aeeffee4c67f8b5d8bfb1908da08db6"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e74e583014641340acacead64f29ecc687db5144890dcb11f8a95bd802eb9c74"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
