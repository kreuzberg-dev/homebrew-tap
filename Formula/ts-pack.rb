# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.25"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.25"
    sha256 cellar: :any_skip_relocation, arm64_linux: "ef39ed23caeb083f2bd56dfd84fc700c4af2b295567fe57e30bcb8400f45a4aa"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "305acfaac7af7e1903226c73764d25e7fc8408c9e10f161382c13452e762f1ab"
    sha256 cellar: :any_skip_relocation, sequoia: "f5f90b97a917552600f066f433af3cb3f98f87c098d6913e26985e363e670dc8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6a2bdd9b3fa96c7394c4c16ba84a33a5b80e1f9b99c6c745f9c9b9b2d7120368"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "7aedc69d1c941a8cc864bed4f4caf2f3d3989cf25b3e3de5c014906838655df4"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "c4bb35918ca8369a3764397f0bf86bb2cfc07f79c6ae674d3d650deb7ab298e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "a7cc58083d4e695d9a42144bfd9e404e2d74b1a97c9bf3300a882053f0490056"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "fef95d5f70de2af1a1c532ab66584b59dbf9e59206288946376e4850170f4a1e"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
