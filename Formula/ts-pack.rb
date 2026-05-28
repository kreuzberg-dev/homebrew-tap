# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.15"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.15"
    sha256 cellar: :any_skip_relocation, arm64_linux: "9110d4cdee84636d2fa16021a033f74473253911b978d40112e07aeea510db02"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "72bc59e5d278e5e335dc2d8584f191f4cae1bf19d7a63de18588bd6de69b4c7b"
    sha256 cellar: :any_skip_relocation, sequoia: "bf7480636b592d8551c7e9cddda4eccebfe0bf86653e31d02f5eeccb48d75d81"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "12bd5764fbaed0cbb7d3ec0a4c12085662e73301b6c415ae1d1fa655ae71a534"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "d613840c686a5b9b4fa7140f4e63a570e95b7ad7380d3a5a3b33145a3f00e79f"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "fa203bdf688782aa644d4584a71aa489f09f06aac30e376e3bc1e83de9b34dba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "bea4728edfee317eed933115531fe090a9e5bda1a532040279200d57ef929c5e"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "c29520c858db8ba71b81bd2b540b005dfbb6f97fdb036c291169c6bc30b68a71"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
