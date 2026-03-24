# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://kreuzberg.dev"
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v4.6.0.tar.gz"
  sha256 "82e5d1fcab8f5c1988af539a5b7cfcddddcd071f07c30315ae31c22b5085a561"
  license "MIT"
  head "https://github.com/kreuzberg-dev/kreuzberg.git", branch: "main"

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.6.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4c5c1f760e8286b7a0b65160ee5b40d2c3435656bba6427dd1f16c1bff2c888e"
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
