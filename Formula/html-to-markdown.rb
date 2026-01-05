class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.19.8.tar.gz"
  sha256 "ff0982291a1e039c58911ec3893ef4f70dec5efd6e4d9df6ce9de1bc5fac71ec"
  license "MIT"




  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.19.8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "dca69a78d28ee392f8d6622abd08210f67365cb4ec0b982751f88d13d07001cc"
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
