# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://kreuzberg.dev"
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v4.0.0-rc.18.tar.gz"
  sha256 "0f3b3faf5e8172c00ad0af61deed8ac9658c5b4c27dc7f412a537dbb43049180"
  license "MIT"
  head "https://github.com/kreuzberg-dev/kreuzberg.git", branch: "main"

  # bottle do
  #   root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.0.0-rc.18"
  #   sha256 cellar: :any_skip_relocation, arm64_sequoia: "placeholder_will_update_after_build"
  #   sha256 cellar: :any_skip_relocation, arm64_sonoma: "placeholder_will_update_after_build"
  #   sha256 cellar: :any_skip_relocation, ventura: "placeholder_will_update_after_build"
  #   sha256 cellar: :any_skip_relocation, x86_64_linux: "placeholder_will_update_after_build"
  # end

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
