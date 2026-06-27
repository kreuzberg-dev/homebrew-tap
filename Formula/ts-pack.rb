# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.11.0-rc.2"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.11.0-rc.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "454001e3e91e9c4cfcc6457890272e93b2f6822ad1248c1385facdfb6b850ea6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b6936295d066800c3d9b75762b658e5c698dcd75d37340f28b22aa9853ed6fdc"
    sha256 cellar: :any_skip_relocation, sequoia: "e2b1dafdd511af8de5c3f526c21c33239f8d030c404959acf42e67740e6f71e2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1e05020ecff38e2992e1a9a467731ddb9d39277b55c20e7ddefbf6b31ec48768"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "e1545bd4f71259dba0d45c96367afef1035a8dbb78ce6702036546a26c479fa0"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "9eb89d0e7f6490f10cadba47396ef5e9ac0eb68eaffc9565523adef8243c55d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "dad7a61410943ce1d8d174942fcf95bc6e3115b959007da1af39ecc210cc9cfe"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "d693efddbdd883cfcfe5699045da8a9795458b417ece77b6bef6553155e11199"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
