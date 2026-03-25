# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://kreuzberg.dev"
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v4.6.1.tar.gz"
  sha256 "cfabf9f1fadce4e5f1cd81fff4f2262cd58b5f7c62f0e82de869c935cd0cbd0c"
  license "MIT"
  head "https://github.com/kreuzberg-dev/kreuzberg.git", branch: "main"

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.6.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1158aea3bc056d2cd7a03c38a842e8f0adb2dfc7b4894ce9c4a50aa1ac473efa"
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
