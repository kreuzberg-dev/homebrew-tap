# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.34"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.34"
    sha256 cellar: :any_skip_relocation, arm64_linux: "dc35d35c0b83a41e1b5788e96d594cbc2eb505f1e2460e9c9e665e549461d7da"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "44b7d398bbb6a3d64763ebee148143ddf64a14c8966d778d9d27c881a443df99"
    sha256 cellar: :any_skip_relocation, sequoia: "871144a1e142e9b0df3364af2018b617c6c036082c750004048cee4f285f2c82"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8232f39ef6e165b22b7791475c4ca42e4bf6a2d768b528d416a76d7b823d5c29"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "c31518377f1231c7b99fd5450e3be97d471deb027d8be1be124993b8dfcfb906"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "03a01bfeabd8917fb594eb822bfdc27db606c601d621f13ac15da03235c9cb4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "2fa9a9b105677890a6e67621ef11b7e236cb16e97e7d72a8bbfef8807dabbd98"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "76e7c9019cd6ecf002153bf30da42df6f5adf8558496b45d09c5e0fdc594bcee"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
