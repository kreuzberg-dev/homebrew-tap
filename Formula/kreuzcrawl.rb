# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/kreuzberg-dev/kreuzcrawl"
  url "https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.1.0-rc.2.tar.gz"
  sha256 ""
  license "Elastic-2.0"
  head "https://github.com/kreuzberg-dev/kreuzcrawl.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    ENV["OPENSSL_DIR"] = Formula["openssl"].opt_prefix
    system "cargo", "install", "--features", "api,mcp,mcp-http", *std_cargo_args(path: "crates/kreuzcrawl-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kreuzcrawl --version")
  end
end
