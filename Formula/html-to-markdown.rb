class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.27.3.tar.gz"
  sha256 "4e566e44b74b4e93881d6ecb09cce31f204ee9d143c6a2f1bd3d3244b3e5313b"
  license "MIT"

































































  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.27.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4eee573c7ce25be96307821aac5d5b1fb8e8569dc02ae5be6f643efcbb74ca84"
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
