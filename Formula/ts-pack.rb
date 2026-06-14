# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.47"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.47"
    sha256 cellar: :any_skip_relocation, arm64_linux: "d68bdd01f4772920dcbc8057f70e527c53858787754cd7ac2c01b2b5569a16b6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5756b04d54c48f1c2bca704aedba9fc5c9a3ad10aed1be64590074d05250471e"
    sha256 cellar: :any_skip_relocation, sequoia: "1a2f264aeacf0e04a6d12c8005222ecfefc2f9c2d9f764bc37bdffabca7ae451"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "778a7394ff67af07beabf8b9a40e6ff0909dfda6f798fc7ec135a72873b52c21"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "c960fdef2d8a4e201ab7e48a3e9901d4ff4cc0cc8535700f188e28ff482b05e8"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "bd80538866a1b29e4e49c106de7a4d3145c706a40bc9d6ac49e28f451bf7e4b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "7a7e1ee54e6edb9da4b3e2b2632ec7bc7c36ea0bf022fdb488066c858b685960"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "979485c4bf8f00fbbf26cc8c3462e81697f31132cb5ccf2563dd628c5bba49de"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
