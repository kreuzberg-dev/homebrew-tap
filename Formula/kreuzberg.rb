# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://kreuzberg.dev"
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v4.0.0-rc.24.tar.gz"
  sha256 "300ff67a41f3f34985fbc0d52732fc76ccb56036ffdd9873ac8c5d6604b14bde"
  license "MIT"
  head "https://github.com/kreuzberg-dev/kreuzberg.git", branch: "main"



  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.0.0-rc.24"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "886aa6ad959be2936b5875253e6c1e2ea7e847495ea6e5286ee2ac4aad82d300"
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
