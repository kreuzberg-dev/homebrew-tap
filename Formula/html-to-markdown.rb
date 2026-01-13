class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.22.2.tar.gz"
  sha256 "ee011349db6a9c2f732d09b746c4fcb0057b56bc0c6be8e8c2de58fed1542cec"
  license "MIT"













  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.22.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9bb1cd1c33b14ca86f707cdd8b4fd82fee391e6273ac10baa2c23974a1effb72"
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
