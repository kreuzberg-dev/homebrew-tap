# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 170+ parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.0.0-rc.16.tar.gz"
  sha256 "e37eb064e537c5c7f838a2fc2755d9185348694084c3bdd48b19088b6a4d9822"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.0.0-rc.16"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c9c746ef9f83b55f8e0c800c6cc93f8a90c661ce413c7a22e4427051b1ef4008"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
