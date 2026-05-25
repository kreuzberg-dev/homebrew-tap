# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 305 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.5"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v#{version}.tar.gz"
  sha256 "42085de58b5adeeedb18d92a9fc2242d15df26bc9fdb9115f8d69c1996f967f8"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
