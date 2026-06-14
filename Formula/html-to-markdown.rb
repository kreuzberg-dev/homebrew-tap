# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.3"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.3"
    sha256 cellar: :any_skip_relocation, arm64_linux: "3d685ca5b5c5dc3ac57489e9c48cbc3252ca7214452661c963c23dbd86758e5f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a89ff710ecba327cf9dc0cbc7f88bca246c9ab6065e73544f884505e7b1a8ccd"
    sha256 cellar: :any_skip_relocation, sequoia: "f46619f2aa2dc98137a5878f89e311864214360f6c314eae9635038e0134f2e5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c7b66c260f3b6b8389ab4784c145ef2e429759095cdd28e166ceec1493938a67"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "ac710af5c86dd11af24f1c28bf69ef90b2be0ae7d424cf2557af46101cff2274"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "ed6de69ea935f18478552ddef401452162f4e47fb5c3ab0d8c49ea248bedcb1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f0a8d7a5842c29e4e785b64cfe57a626b8071603a817ab77fd9b92d9c6436f3d"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a78f773bf45cc5a7f425ada90c12ba4f5341e7df4acfbcc5bfb6478a0cc9e80"
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
