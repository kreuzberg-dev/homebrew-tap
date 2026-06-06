# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.22"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.22"
    sha256 cellar: :any_skip_relocation, arm64_linux: "0d30d393c30bdd2eeedf6f5d61e60147fd91e06636e28621300903415dc7af01"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "10205208bb2cdfa8a0bd82386cee9507afe401a915fd66de924fd33a981a5637"
    sha256 cellar: :any_skip_relocation, sequoia: "9b40209e348621ffd1adb69cf582a63367357691883f3b4fac746851d5ad11a4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8bb66804bbb8de43c80d0a551bab7513d8ae92f63d71207d07ffc41c9dcf3069"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "f05e8575902b19998c5461c0b709cf931c89270aa54a2972d3d15d4203f75681"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "8d8b4a42baa73d18bbdad245afccfe37ee9a88acb23a14403fee5998c82a74c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "ac89e4bc9c528e9ca4e495408904c3502ee9d7765c8dd6a7f59f6c20cb12b15a"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "b72be46f88247cbe7a8b189722f8d116983a661158da6e1773682983c9ab4dd6"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
