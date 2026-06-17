# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.54"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.54"
    sha256 cellar: :any_skip_relocation, arm64_linux: "b83c32245b35db56b70b55b32a060e1be5969ad8e81e544882f04deb6524b822"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "16d5f9aadaeaa420f5e4a6cd847ef2443b0c895305c80891f4d411e16b6a12a9"
    sha256 cellar: :any_skip_relocation, sequoia: "418ae10e1398847a4bf114dec21b669a08638562e3fad5433bb7fc3cf42312f4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5a734dc0932dea01ab7afe59c99b184517a142b4b07334e99ee587bfcbed5529"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "dc6a0d46f7de9255edd2a3a356bcc1d010240d50d542365f7bf6f1003c83e49d"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "d552739c54081b0cd7208c4641e0de893a00f1a8ad0b18656a0cbb137797b9d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "8ddc0de543a1d12a1b046342911f8ebf26a2349d6e6a3fd67b5b111e7e62fdea"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "774b70abfcfbcfd07b392d491d563bc452e45c9194df5268ea0399b5eff0db8b"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
