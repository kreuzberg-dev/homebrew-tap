class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.26.0.tar.gz"
  sha256 "cf0c47fb4804836ecbd6efbb777aa9d5cd5c4733b45ad315691955dde904b475"
  license "MIT"




















































  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.26.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d02809b3f33b7df8c46a8e5034c010522c821cf722245a777c5c16fa29c6ad1d"
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
