# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.5.0"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.5.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "c0c2f6dc43fac42954c037dff1a84fcd2eab34543ac070953a81812981b89fbe"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "519fd6baa2d164b1c42cd62fee9841b373738046c563fe6a9933bfe53e5d9cf7"
    sha256 cellar: :any_skip_relocation, sequoia: "be4c77470c866cd8ffa73e2d4b69187cc9e46467b4589709d3182b32f3434fb3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b9031de49410bcd2ec261a1e0dd6c792e2c0924685877cfc20de037dbaba1748"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "73145ad564e089bb4ec8b5d72ed6969150303d8b0b9cdc3756bc85d1f11ba0f5"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "32b32aea31c9be51c01e4c4df6fceef8d0f52d94d00f89ca09a24af59510fc27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a77755f5a9bbbc422ed2eb651f0a96a817b1dabe69bd270cd5a3f6014b7f3fb6"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b2df5c06950b1d9e337f5fd23c5a5f7aecc2cb2414f9e78ec7bba9c7a8b65f5"
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
