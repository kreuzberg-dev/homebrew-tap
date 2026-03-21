# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 170+ parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.0.0-rc.17.tar.gz"
  sha256 "f3037aa3bd8e8addd12fe067ab775710126b63cc0ac5b0ac6c682d6fa1c97ee7"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.0.0-rc.17"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "21bd724fcfe2b1a6aec11e7acfc3daac69c7252693361cf6d8e82923ad9e8eab"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
