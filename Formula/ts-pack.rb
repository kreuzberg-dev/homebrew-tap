# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.12.0"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.12.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "150fd220da21e214d8ff1fab76aeca09447cfcfc264a26fa7c1dac9afe920352"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "6e9f1b051e5394800eb5e4a17c46504feba3ad6a03399fdfd3c58c9201247d26"
    sha256 cellar: :any_skip_relocation, sequoia: "a5f3716711781ed303ffb4b19bc1b5e23acbe03f792ca7c41864df831e6f3d7c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a708d757657822dd87edb72b79ebfe729585078f80939ea1347fa60ca3b8573f"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "d889d4ff8dc89a2472bbd3cc2b8a95065f2065207b73a79a011fca1cab5827bc"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "bd1d76a7eab6465a5e182abd0ecba8266ba616075f65912229f53a55970bea38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "bcb9a47492087d2de26b4b37e8e7481785c6f360140700b79d2bca953df89f25"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "c8bc8def180873fb12d85a905e84205737f39f600ad78b2b5c7d32ba292035c4"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
