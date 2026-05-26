# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 305 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.9"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v#{version}.tar.gz"
  sha256 "ab2fce2ab0d2707003baef1b5ea13b61cafb6247804741cdd4e4dd2b715b0568"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.9"
    sha256 cellar: :any_skip_relocation, arm64_linux: "ffdf2ff261d5516ed8f6d6e8efd9572fff17ea1e952198fd88c7af8738ae98d1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f2ba188741e02a13fbc869e9d8ee2ee4d794d3ea9241380678fe74b7d7643733"
    sha256 cellar: :any_skip_relocation, sequoia: "79b00a44bcf541c269dc4b1285c99128f4a77338efcf0f0f6c7166f3162f6c57"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "96efedb33d3b4571b9db431d8176ec7a51814ee4c2fd9861a467573d41721d48"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
