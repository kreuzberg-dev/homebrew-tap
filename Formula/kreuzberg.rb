# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://kreuzberg.dev"
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v4.2.4.tar.gz"
  sha256 "e024bad6bc7150b599e724337960e95fd4d141f13bfc8f14bc3c67ad0208f39d"
  license "MIT"
  head "https://github.com/kreuzberg-dev/kreuzberg.git", branch: "main"

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.2.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c024c3c2d6ead4d355ea597cd043f124572c7eb7cd49339dfd3d0483c5647221"
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
