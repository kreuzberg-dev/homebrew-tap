# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 305 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.12"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v#{version}.tar.gz"
  sha256 "57c4f4dd49977a0181e5a03cab0f9c74545c0047e4cd5d83ea9167759cbf5d9f"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.12"
    sha256 cellar: :any_skip_relocation, arm64_linux: "b6e1c0c032b33fc9e531b08030dc90484f48f9beaa656407d2eae863267bd6b4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2ba659e08aa077f7ea7d147a0dd05a747eeec292e99aa3db745364d59c4de32c"
    sha256 cellar: :any_skip_relocation, sequoia: "7062435d389219e026cab948ac7bbe08f709067da184f7aca93383eff2acc481"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7eecac76413d264a243c5c323b332ab24f2ddf223c0eeb00eb40200dc70f5631"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
