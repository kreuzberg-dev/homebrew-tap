# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 305 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.7"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v#{version}.tar.gz"
  sha256 "dc41a8f42029dab643de407a7abbe88f5b512903a1f2d4a798c7d73841711bc0"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.7"
    sha256 cellar: :any_skip_relocation, arm64_linux: "85da8f9b5af055cf45d2f0fcc8eef73e984bc68202685afbb3a7c3d66eb20a1f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c858ff66d2d91eeb96aeeed891a3772ba1eddba849c03ab372cc00dbf6023515"
    sha256 cellar: :any_skip_relocation, sequoia: "485b70b35d8ed2703ad6a3b8941310bd07e4108163a6494cc40ed173c957aea1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ed747cf846ac1004c12c2b14bff569e457f4c7d72c4e4f11a7a994d2661cd688"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
