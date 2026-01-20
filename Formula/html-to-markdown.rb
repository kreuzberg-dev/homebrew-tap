class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.23.3.tar.gz"
  sha256 "368ed08454374003d972b63308a542bfedc94fc59c6a902ae443148a5bdf30ed"
  license "MIT"































  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.23.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "64f2b08c3b6501d924adf4e670dbc8ecbb445de98a27b3f70fdb2ef8d07373b1"
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
