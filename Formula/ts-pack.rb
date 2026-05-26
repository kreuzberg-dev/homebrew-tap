# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 305 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.8"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v#{version}.tar.gz"
  sha256 "9714f0ea34a194cd5e0bd0144fd0e93e4678eff38d8f9db7de0ab8eb195347d4"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.8"
    sha256 cellar: :any_skip_relocation, arm64_linux: "64aaad415148e073f7357a37eb2ed2009b681c18feefa92ee5fbbfea49ddc433"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "607a49058e7531ba04bbb6365fd434509f049275a0275ca9ec246fe997db89f0"
    sha256 cellar: :any_skip_relocation, sequoia: "ea2107e00485f120c8932f86b137b7e514cc088694aafd7c8e5617cdd46795d8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aa0b0ade70239c96c1ea6bd194f082f5e5e1ba63013c17a618d1e45039c7b606"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
