# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 170+ parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.6.0.tar.gz"
  sha256 "891626195c507d79468273c90ab94b8d68621e0c99e0aefec30141407afe2197"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.6.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5008c556131f180e11717c6f0dc1ef1b0c12908772d56aa212298e01b0cfc0b8"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
