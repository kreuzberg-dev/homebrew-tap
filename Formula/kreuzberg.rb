# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://kreuzberg.dev"
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v4.0.6.tar.gz"
  sha256 "c254166b1d2edc10f48fa6283eb8e534947d6b172ef133ea4ff46bdfbd6bc686"
  license "MIT"
  head "https://github.com/kreuzberg-dev/kreuzberg.git", branch: "main"

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.0.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c6a0542e52c220f946790ada7d6f8551d2b81e2d6a3de8e77db99f7c233ab95e"
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
