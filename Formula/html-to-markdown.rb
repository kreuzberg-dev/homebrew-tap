class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.19.7.tar.gz"
  sha256 "1d08ddd4033b6aa82611f7d01d2b1c66777434fe2220db953c8bc2801ef32dca"
  license "MIT"



  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.19.7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b07277a70b2bdd79ae5896780fcafa03e36d8d4c469b18b4b26628d40146bf8f"
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
