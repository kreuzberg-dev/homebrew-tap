# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.16"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.16"
    sha256 cellar: :any_skip_relocation, arm64_linux: "612ad6e4f72d7f24aa9f3ca7a8cdf01c600cbbe33c4ff85e549a40e1db8b054f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f16d8643eaf6da3a64f870fc8eed5fd1ccecd2b85c2bd61bd8fbf1b9cccc2fb7"
    sha256 cellar: :any_skip_relocation, sequoia: "f49a8ee9202041a6ee9b349dc44fd7725101a1d6e056c58eb05da12621043df7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bdabebb0ec718e40971aae65091ace13cede8eb576db097d6a0c0d30f171ff32"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "4895a9433abab7f0e408d9abd6b210ea0a4c1f9d849d3d425020e244e62c26ad"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "18f8e893a5d5464be5f5f5a7a3318e1aafb3bf68b4257dace3a2ef2e31fefa76"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "c8e15f90f40ef45a53fe446ad77140e833260794be5bb390afc78049717eeb57"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "894f7df6b9aea2519fc57bcb22c89282ef7020e11177c08b3e5a2007070b04c5"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
