# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.43"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.43"
    sha256 cellar: :any_skip_relocation, arm64_linux: "3a78fc86d8aeeb54fec17933318a7202c76e4dad8f842c8c8e013ee0dd1fa168"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b5bc8d70073338ac104003a139bf9f5b835e37956c7533dcad24e93a2ad2c5b0"
    sha256 cellar: :any_skip_relocation, sequoia: "ada7c0fc184e0fb220b32599af9c7988a17cd47162659565bc0dbfc753ea1059"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b483e8dcfb7f31a9467733739e6bc1903b254c518c7b5ffb0874ff5bd21b6dd8"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "b44a082b276dc5b67f02f505aa5be2626e6878ded187a433986ad21e0475d5cf"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "2165c91fcbd8ed32597dfac6bc2888143e92f35e28130aadf43b9803083f301c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "8355ffc31d71ad123b7ff38c278ef38ee47f0e188d1866172ff09053d0f8336a"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "6a1e8e323e7f73c579f5be1778b590d951cc106e38aa20cfe712f50691269b28"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
