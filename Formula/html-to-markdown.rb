class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.26.1.tar.gz"
  sha256 "d0aab27c126d9ab82d6ac60d476fa41097c8b24c3dd73b92e661ceae5299c0a0"
  license "MIT"





















































  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.26.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "64e36598416dce37274005fcb50d2bcff474e5a6c6d9e3c63e0429cfb0761fb7"
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
