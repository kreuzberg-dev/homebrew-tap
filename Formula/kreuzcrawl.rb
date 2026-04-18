# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/kreuzberg-dev/kreuzcrawl"
  url "https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.1.0-rc.4.tar.gz"
  sha256 "8d253c81ddf6a33877edc17e82f7da640f28cf04de0b3a060b947f1b4e879398"
  license "Elastic-2.0"
  head "https://github.com/kreuzberg-dev/kreuzcrawl.git", branch: "main"

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.1.0-rc.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "62c67946910e1e4fffcdd9baae4f206c7298aea6e460cf6c66b0bf830768b26d"
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
