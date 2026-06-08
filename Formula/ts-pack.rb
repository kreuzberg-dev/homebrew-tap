# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.28"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.28"
    sha256 cellar: :any_skip_relocation, arm64_linux: "8f6fdb4cd92c6dfccb88d89f877d7435ff4d27e1ca416b084b8d13d1fd46f8f4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ac711335eb9e998a23db5b1a6709a545f76df2220296102aa6bef0a6db49fb5e"
    sha256 cellar: :any_skip_relocation, sequoia: "a921327a104c0125d46e01747eb9fd28203bb85db4e7f91a19a0fe0f205f187c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "30d3d46c85186b542640a0777f17edbf30cc9417de29807814e0a7037f1d07b0"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "784ebadae7bda3ac5758f0d0c303793324d57cebd77df20829634413f51954d2"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "adb62e6f906c88a47cf3b99ee3b71d9ef30b12acc7766a6b7aaeba5220d26f2b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "db29529cf242df1345b22a6355566a53467599747d83cd387bf6428d36749eaa"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "13dd63a1764596e9d1a053d6899e8230ab85ac74ff189c8d64c7f5a2e343e971"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
