# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://kreuzberg.dev"
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v4.0.0-rc.23.tar.gz"
  sha256 "0f3b3faf5e8172c00ad0af61deed8ac9658c5b4c27dc7f412a537dbb43049180"
  license "MIT"
  head "https://github.com/kreuzberg-dev/kreuzberg.git", branch: "main"


  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.0.0-rc.22"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "42e2e152f99e018f07b836606a8238cb9444f6fa293ed353f50b0f28700cae2b"
  end

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.0.0-rc.22"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a196fb85918756b6fc0845161f6f29b4419b2b3bd2c970d529e59f032007df6d"
  end

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.0.0-rc.22"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f670988bfbce3357d44d1baf1c1a72271ac4394dbe2f6192b1eac8c74b0d0522"
  end

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.0.0-rc.23"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0dfd119121dd9d68f6e830a5fd193c81862c981068c545dfea4f2ff9aa2947db"
  end

  depends_on "cmake" => :build
  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.0.0-rc.22"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "42e2e152f99e018f07b836606a8238cb9444f6fa293ed353f50b0f28700cae2b"
  end

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.0.0-rc.22"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a196fb85918756b6fc0845161f6f29b4419b2b3bd2c970d529e59f032007df6d"
  end

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.0.0-rc.22"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f670988bfbce3357d44d1baf1c1a72271ac4394dbe2f6192b1eac8c74b0d0522"
  end

  depends_on "pkg-config" => :build
  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.0.0-rc.22"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "42e2e152f99e018f07b836606a8238cb9444f6fa293ed353f50b0f28700cae2b"
  end

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.0.0-rc.22"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a196fb85918756b6fc0845161f6f29b4419b2b3bd2c970d529e59f032007df6d"
  end

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.0.0-rc.22"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f670988bfbce3357d44d1baf1c1a72271ac4394dbe2f6192b1eac8c74b0d0522"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--features", "api,mcp,mcp-http", *std_cargo_args(path: "crates/kreuzberg-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kreuzberg --version")
  end
end
