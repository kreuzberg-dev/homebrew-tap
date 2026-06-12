# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.1"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "05d10f3fb66d7ef4361aad02f8a0ef871ac43721c2550583e714c491b1a6ddf3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1ec3cf5e0af33e33b069d5eb21b591817c4112dc1999975c59d340a59c25c29a"
    sha256 cellar: :any_skip_relocation, sequoia: "7f1da688fd39c753939275b334e0aba0f23f7a8b48e9e98c33c65b88b0609a25"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0b7c3ebf0df5b5e21e2fdf792304da177c00a6619a2cded230d219e60a3ab8e5"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "0e322453734d0165991c66c7acaaaf9667c865dd63bdcc2b7b87e9fa8a1b12e4"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "c34b56e0ac1996470b92cf28d8e33d480f539c15fd27d2f77cd02e4461b655eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "863700a8724d64f235a6786bc8f6aab4fbd2254e49a508dfcaae227c1d567ca8"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3c4518716235cf85f4c00199cb21b715007659440210a1d8264483af945b0d7"
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
