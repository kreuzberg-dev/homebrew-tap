# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 170+ parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.0.0-rc.12.tar.gz"
  sha256 "749f96227785b4f83911959e409116a8ceec0ec56b43883088761a4e8285a3c3"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.0.0-rc.12"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "84455e69c33e79e7498d3a87e9671cbf7548d5da5abebf5c3c0edee2fd5fdba3"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
