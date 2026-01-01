# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://kreuzberg.dev"
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v4.0.0-rc.24.tar.gz"
  sha256 "346078f68356f01a1795ff095e38b51f827c8c56c61c62956daf8b884f8b077a"
  license "MIT"
  head "https://github.com/kreuzberg-dev/kreuzberg.git", branch: "main"


  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.0.0-rc.24"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a8a3069ac3b1b1321a7b2f2d2d8cf77e6daff57b4d873a8f66816ed91f3c406f"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "api,mcp,mcp-http", *std_cargo_args(path: "crates/kreuzberg-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kreuzberg --version")
  end
end
