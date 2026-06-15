# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.51"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.51"
    sha256 cellar: :any_skip_relocation, arm64_linux: "4e7b33c899e840009ef0fef6842520f58c6b66de89f33df5d9c03b7065b14cac"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9d5f5c3eda94fd08bdbdae8636d7c2aaeba43b7d06c4c61a80b0493b7f18d430"
    sha256 cellar: :any_skip_relocation, sequoia: "1fd677281cb0d1695d1e8996ae89e3fe57582b9662f90af7055194e3ef208732"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "126c07fa73902ea009b859c0e6e797ea0cd6f066ff7b4c5a21d73f692587087e"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "7318a6fb459ab123d80d00eeb5002362cdbdacaffcd2f72ee23c3eb507477b3e"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "3fbfde03494fb3c96a5b73ced70bdabf3b5f8c9478bab9d26b522525c90f314f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "0aab8d04dda24de1c7bfd8ffb2b303f365700f3f1dafb4f530bd2d2a8f93cef1"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "10850be3111e2e10b21c26f34ccfc3b3f3db1dbb34b93ab74d4d8e9f3e22b908"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
