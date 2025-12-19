# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://kreuzberg.dev"
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v4.0.0-rc.13.tar.gz"
  sha256 "fdce82fde60418ceab80b9162034d53b1abefdc6cf39b69bff74ba4dc474af44"
  license "MIT"
  head "https://github.com/kreuzberg-dev/kreuzberg.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/kreuzberg-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kreuzberg --version")
  end
end
