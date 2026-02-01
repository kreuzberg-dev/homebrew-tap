class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.24.5.tar.gz"
  sha256 "3a408b3d7294e0828abb1d8212e113a7401bcd064f9f2bc569adacd03e6a0f0b"
  license "MIT"













































  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.24.5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3ad1b5bcc27fc07876bb27c7164ee827e55c63759bd11d94dd3f5c87556c6475"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/html-to-markdown-cli")
  end

  test do
    # Create a test HTML file
    (testpath/"test.html").write <<~EOS
      <h1>Hello World</h1>
      <p>This is <strong>bold</strong> text.</p>
    EOS

    # Run html-to-markdown on the test file
    output = shell_output("#{bin}/html-to-markdown test.html")
    assert_match "Hello World", output
    assert_match "**bold**", output
  end
end
