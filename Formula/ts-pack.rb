# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 170+ parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.4.2.tar.gz"
  sha256 "7d8f80f40ed8ce336492a30d3d01ea6753ddfce2106db79f96301f8f15598679"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.4.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "075cb9be409b1c04dfa5ffaabcd8cbf23263d4893a8884e3e79b8070e1e1d2e0"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
