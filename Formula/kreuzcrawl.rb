# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/kreuzberg-dev/kreuzcrawl"
  url "https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.1.0-rc.7.tar.gz"
  sha256 "d45ff80a726e30b0a15d4a6aebe0fcd6908a22f132ebdccc73fc54e4ae2211b4"
  license "Elastic-2.0"
  head "https://github.com/kreuzberg-dev/kreuzcrawl.git", branch: "main"

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.1.0-rc.7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "78ae72a2e7f15a9c1174c708d1b991216f4422815d7363b2a86aef4d715ae77d"
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
