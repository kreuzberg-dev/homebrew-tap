class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.22.1.tar.gz"
  sha256 "cc522d0668a1b1735b14e4ba0d09b19ed756dc46158d1b18cc5c6774d528e375"
  license "MIT"












  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.22.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "30095816b0e0d8eec092034b41e3d56dc5d08f2470cc61b4524505808404eda4"
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
