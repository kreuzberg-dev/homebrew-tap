# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://kreuzberg.dev"
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v4.2.12.tar.gz"
  sha256 "6a29e7f7c59755780a69703ec744e1bc9b9e52e2427bbf4640e71b62060aad10"
  license "MIT"
  head "https://github.com/kreuzberg-dev/kreuzberg.git", branch: "main"

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.2.12"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "474cc4fe7aa6fae53ebed61fa6fd50c1f7de5b010425ed0e8b62f298ec8bfb0b"
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
