# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.12"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.12"
    sha256 cellar: :any_skip_relocation, arm64_linux: "8bbaa47f9243e29bb8e360d4dfc24600098f7255d78d21a4cb470c0080ead4b8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bbfb63d5788161c66204202c3cb992a449a16e5709fb0af7fe4bef5708936c94"
    sha256 cellar: :any_skip_relocation, sequoia: "9c5db5d154aa17e341c1407d4bf0f75671c6b16e6484847ea99746cbfd25c934"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b44a76b5663577c2b6f3dc07ef6fd15e6c08622cc516e21d6845eb52c0e536e2"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "a9005d0d02cde7f5c262783a1de956648546f6168216d7df752665e3a63e8c1a"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "89716c5b5939058093e7d5aa772f7b3952fb4ca302dbb0948400e000257bf3ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a5de1991725e76258c3eb9cf687a3e4dfe4d8c819be4b643ae1531676b4d88f"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e4ec49a8aa8d7496b3e467882112d7d626ffdb5f8721b823deecb7bfc41df49"
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
