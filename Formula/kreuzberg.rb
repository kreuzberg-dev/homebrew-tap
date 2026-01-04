# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://kreuzberg.dev"
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v4.0.0-rc.26.tar.gz"
  sha256 "60f4f50b1f0aad909f578d870b82b628fc9932503a07f23951d08bfe90be8c18"
  license "MIT"
  head "https://github.com/kreuzberg-dev/kreuzberg.git", branch: "main"

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.0.0-rc.26"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cbe2f93d64e7e9e590b5fd9b701d7cc966a110d5d6197ba8698ff04b0cb2a5b9"
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
