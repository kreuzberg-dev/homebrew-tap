# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 170+ parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.0.0-rc.10.tar.gz"
  sha256 "79dec785ba500f087cb0fbab3eb435874ea347550f7d17997217b8cbdd9e30f7"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.0.0-rc.10"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5e8086c200a1202eb59d716899e6d39e9d21b4af1f7fc54b5dd7088b69b58f0c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
