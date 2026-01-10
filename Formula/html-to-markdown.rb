class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.21.0.tar.gz"
  sha256 "6f2c27042e8e30d146e2fd2d2d40f1ad78c7c82e9f7d0f3fa96a4d93a90d73c1"
  license "MIT"








  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.21.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "db8e69761d170272584c0a0903d4fe216f70d0d37e4771ac9eb615ed91941532"
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
