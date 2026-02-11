# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://kreuzberg.dev"
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v4.3.0.tar.gz"
  sha256 "b621522568a208a6a442db2bf324ef91e66be5c28f8bff984a23f6517ba5c44a"
  license "MIT"
  head "https://github.com/kreuzberg-dev/kreuzberg.git", branch: "main"

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fc3a0116876106da85f0f064122bd168320a6b8d2441ba20250803ec5aad5bc2"
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
