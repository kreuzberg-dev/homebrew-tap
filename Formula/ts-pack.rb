# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.11.1"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.11.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "c4b76898e41af47dbc064a3304014aa98b76b0d83866593cae37caa4d604795d"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2386f253adc84192cdd67cef7e679e319b313736e17274dfbf0f7ca0a68498cb"
    sha256 cellar: :any_skip_relocation, sequoia: "2dd6c20f5df739592ad0b91297fb19250a07dec177a67256be05bd9bc799e4e8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bb26140dae20bd412e09a8debe04a58cb7a1a25fb4ba72546e15682294b4f650"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "87c0125e415c92b5ad1ed6f595268ca7be1ee2d539a1b2e51667faee6ce7aab2"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "e36a92217ff70de7926975af1eaf5558e0941480ae7433df0245d21d35ceacdf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "40e258e744a1d3225099925f6ec12f2342ec07307e7b16224a805634bd2ee0f8"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "db41cf8edf5ae131eb570559117fd3979a696b3d6994ebc734277da7a84c5024"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
