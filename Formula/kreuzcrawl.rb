# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/kreuzberg-dev/kreuzcrawl"
  url "https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.1.0-rc.3.tar.gz"
  sha256 "c6870d050bf9ee9a7152b3d5696deb85d3b3ba9e7ed9fbc45bdb858d35fbe978"
  license "Elastic-2.0"
  head "https://github.com/kreuzberg-dev/kreuzcrawl.git", branch: "main"

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.1.0-rc.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3115e700163d8b99b88603ef44dbd612f1e54fca652c80ea602aec480123fff0"
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
