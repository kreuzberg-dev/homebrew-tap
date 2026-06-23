# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.7.2"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.7.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "28d6ef306c71be02272ce940b2fb6f700858030e6ca44cd40e150c0e14911018"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2fed6d80f586b76fe16644a174ea5699227dff9e035c506c1084af6167dc73e6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8da862991ea49cec77cb4a9e804e8e94e1ffe9d582ae8b76c7e0a08473f22f1f"
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "629dfa353663dfcc0810c05caef35ad07e1af1b8906128a8c2f89b9f9f440b03"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7dc6d16f660f4e73fa41ba047f6a9cffcb045010cdca6a23bf2455bd16021a08"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "15b78f3b1161bfda437c585998077a3e991b67c6f4d916e213f8e7a5596c2740"
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
