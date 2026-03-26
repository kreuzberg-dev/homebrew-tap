# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 170+ parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.3.2.tar.gz"
  sha256 "5922f6d7fa047f413c72b04456dc21af7b4af72bd682e12d6ff5d29a31bfb213"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.3.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0dfe360a5beaed6f8ff0e704300c4113beb0d0c8f6b0bd01d4c7bc449cdb9333"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
