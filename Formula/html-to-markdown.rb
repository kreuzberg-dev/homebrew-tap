class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.20.0.tar.gz"
  sha256 "80ebf68e392be70fda97c267e1c66ae83573f8f19e954c7110324e053973a9d4"
  license "MIT"






  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.20.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e053d2836ce160d595485a91db7bf0b5274c782fe4dc7166dd03cb6f13262942"
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
