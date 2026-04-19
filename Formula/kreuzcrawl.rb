# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/kreuzberg-dev/kreuzcrawl"
  url "https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.1.0-rc.5.tar.gz"
  sha256 "3fd67e364523dc22d5d9cb6d0c0b606c8bd9452d7a63d998c6628fc7a84e72b6"
  license "Elastic-2.0"
  head "https://github.com/kreuzberg-dev/kreuzcrawl.git", branch: "main"

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.1.0-rc.5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e33e30f6bb29c02f62b9f94f190d154900e22707aac366f30229e6e148915de0"
  end

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
