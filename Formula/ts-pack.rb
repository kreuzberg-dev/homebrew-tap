# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 305 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.4"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v#{version}.tar.gz"
  sha256 "9bcae48515225de0e707550f9b6192ab92191c0d74f01d382bddc7e6f6eccfd2"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.4"
    sha256 cellar: :any_skip_relocation, arm64_linux: "91410d29ca93521738e4b4355f5c0acfcd34a4c628b20dea4423591e96a9b7fe"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "01881040e06aa4e4f497830ae7779f1ac97192728dfd4460f0707277ec387f50"
    sha256 cellar: :any_skip_relocation, sequoia: "2a89fcbf45ab4250683dfc8228f7ff9638272527bf33be8994287896fe32967d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2f2d94bf6f7ebbd115346211c364c23b3fff24ed86e7ccca6ecdaee35d62b306"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
