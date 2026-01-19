class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.23.0.tar.gz"
  sha256 "c4438f68dd8e73197ea945c937fc9e2c3ffd3cc9b931c7b545aa4971a69981ca"
  license "MIT"

























  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.23.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "15e7a49e884ae98fd791b926f733b8c03efe04c8fa0c357fc52d635987af9e0f"
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
