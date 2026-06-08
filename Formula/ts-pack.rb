# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.27"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.27"
    sha256 cellar: :any_skip_relocation, arm64_linux: "2cf3600cd6acbcc403d9c7b5e39330f67fc9f7ec2a08720a08dc54b79fdb7143"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "dcb63ba9292c231b1fd30d7484b98493e18f91dab54b591c9f99c63af293d7d8"
    sha256 cellar: :any_skip_relocation, sequoia: "b5c6b655dd596a017c3b72ec905ac55888081cee8409b9e12f488197e5a06de8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a3c8fccf85c2680f61671e3b3d9c7db0122711c71c8bb971422ae2c6fd78e6b3"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "dde841f96aacc625f19a5e35c3141c2aba8da175a02fcf787319e0ec343944da"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "91157d9a5fb4e0f14c89d414b8ad63b2cd9c1ba854c67fe8ab4a05ce78267787"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "ab752565d23ed9c663b4590c1f9c0f65f8f8e99b8a212b77d813d26230437308"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "39ddcde70effe51a6eccfdf744920f05dca026280969bf441c0dd284707d60eb"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
