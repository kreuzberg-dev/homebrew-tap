# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.5.3"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.5.3"
    sha256 cellar: :any_skip_relocation, arm64_linux: "62fbf99cabf1b77f817d8ac6c22f5f2e4ae737a532cea1344b718b51ba327a09"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d62dd9e2880e9d698a032f29c0ffaaa0cf1ce3dc6a55a1778c6505ba26ccc934"
    sha256 cellar: :any_skip_relocation, sequoia: "38bcccf9dfb30c66980ce65fa75b525fb671c392a9feb3709ba9c54da8105348"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "909923f0ee355f9345ef73e28f42623193df1fd197c46a3d709af99cd405a263"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "2d09e3d93879c6edc78961b52aef47c9f0ac862741674bcfde2331fc47a3018b"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "fee47979d0a68ab10f2ca7a8f71a291ee0035cc179c54b799b5548ed22760063"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3b97faa73de428a2f16606b7e835d627a435dd377bf9d56572184ad37969acf7"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "56c20919555d993ff5a51080b347b0625a45df3058fb1aafc8d650ac3f2834a1"
    end
  end

  def install
    bin.install "html-to-markdown"
  end

  test do
    (testpath / "test.html").write <<~EOS
      <h1>Hello World</h1>
      <p>This is <strong>bold</strong> text.</p>
    EOS

    output = shell_output("#{bin}/html-to-markdown test.html")
    assert_match "Hello World", output
    assert_match "**bold**", output
  end
end
