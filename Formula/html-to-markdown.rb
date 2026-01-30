class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.24.2.tar.gz"
  sha256 "c9b95d70abc8c542ecf6139d87952795891923f453b67e0db8681c08b954ac79"
  license "MIT"







































  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.24.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8b718b0a03973f681383d15218cf71d2943907d3eefbab8df271cc91e91fd9cb"
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
