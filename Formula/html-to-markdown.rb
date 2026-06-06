# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.15"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.15"
    sha256 cellar: :any_skip_relocation, arm64_linux: "12838de1b7487064dc44a1128f20baea7913048c8efdd030f43f86373cd0b59a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "918b44a012cd29ec5fb8084c7b1398d3cea1386f2f1e7da570e280aa899b47b1"
    sha256 cellar: :any_skip_relocation, sequoia: "0e0e3f8c66190a5cd7c346fcfc1630a168de0e1c49c7b113e0d9744be4c9495b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6a743b1d1ffc165f6b3eb087de188ac4cc84e14da755f0a581334c43b13e28b2"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "24d3fffe0aaba397b506480bb1e568193c9a3f2bafda7d9a8024eb5914aac9cf"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "e68c24e2f128a7235b5f2d03147b334b152d73a3c2c30273d29b07e762662895"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "081b1fdce7c7853f53f60fb9ddab35c7df3af76abe53eb6d7c0bf3f0e416303e"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba35144dd2cdcca807671586696fe54ff1ab13c7591af389597bb576b6c66bb6"
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
