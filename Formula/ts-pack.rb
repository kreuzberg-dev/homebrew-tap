# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.38"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.38"
    sha256 cellar: :any_skip_relocation, arm64_linux: "bc94ff03d88c05fd6b771cb823df5238cd37e08ce8e82f895f038b8303dd6775"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5cf33b9f8938158c5caf0b8a6c3efa47f994c31ed1aac6b3c5c52fee79c3e630"
    sha256 cellar: :any_skip_relocation, sequoia: "894951f755132a102c886ec71120186f0b8ecf8ce5f365744ecb0a6d8d310c91"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e182271e5fbc4a3c93ea3dc2d95b176c5fa2de03e76cdc83e843c14115a48e30"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "43968a2fd1dd762b6b5d9c5a1b1d0c6b485eecb7a1385c4a30c96c15209e58ad"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "528476920dd5fa8adeca113b949b62a9aaccd7b882bc90a0c830dbbcf849aadb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "d0a1ec9561e89269edc8ea9c8d5af3f54b603528c36db76110ca84bcf8869354"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "e5e48bbdbbaff569cc8e18eaa2b4d394881e72734900269e15a595c854ae9b74"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
