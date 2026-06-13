# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.40"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.40"
    sha256 cellar: :any_skip_relocation, arm64_linux: "fbc8e924c51aa9ec0ed38624a24ffc4c779c56a7ff41f57d9e36402556a19e93"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ea1b049b29f43fcb72480352a9aa28d26269c5d575300756e0a09ea9bad1f57d"
    sha256 cellar: :any_skip_relocation, sequoia: "94e695e3f6e7b0d1d29db40b41ed1d01af7653f8d9ad10bbc46928111e43b1ca"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5af6d2a04467adfda0f27bd0075fcd385491e6746a4aa674a1d999a65574df2e"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "af14f3c5d00100fa2876900e29a10dc0083a34aac95ac87666f8cc80977108d5"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "8d35c692fefc5bf482b09de48726f0e30d736b6dd3d29154376cc684eb240b9f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "d27b1078e867a64b632541089b8e73b291b7714ddfb36718c1b5396ffe0fdae4"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "3bd1c4663fcf81ef7cf5f795b0ad8a752a2d6cdaf3d511db9dd9d4008df527e1"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
