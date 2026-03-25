# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 170+ parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.2.0.tar.gz"
  sha256 "155949f9e84bb84f2b9e99a7f45944e05d1ed16b66dce0df870ad57ceead4822"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1f2d4ed4af2f620c515af6d5e3f10ddb6a57596127a3d19a6efe2ddbdfa07952"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
