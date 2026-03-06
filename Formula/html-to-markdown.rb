class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.28.1.tar.gz"
  sha256 "a4544ae5c68527a055dc0e5f81517d8b45d96fc7ef17df43cc2a7202cebcc328"
  license "MIT"




































































  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.28.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1f223c364543c72cf0adedadeb4bf27b8ee56cbf5cbf0258de6346aa8b7e3fb4"
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
