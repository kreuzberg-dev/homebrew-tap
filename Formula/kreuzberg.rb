# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://kreuzberg.dev"
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v4.4.0.tar.gz"
  sha256 "71e08d5c9e3b64719e1ffa714d3362edd0a4ae54cfbb03181bd34a239dd9d60f"
  license "MIT"
  head "https://github.com/kreuzberg-dev/kreuzberg.git", branch: "main"

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9dbe221c4b4a85959d0cd01b0c6e6a8fd3a96444fff4eba38054edd7e23a0a68"
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
