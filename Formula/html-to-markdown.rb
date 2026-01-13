class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.21.1.tar.gz"
  sha256 "6a21da19240baba20e1e37337195008ceb9855f2290c9e5a6975ce7125dda9cd"
  license "MIT"









  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.21.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6e8680fd6fa7571d91e5fca5bf2fe098273b1499c960aad02715ee3a4671a71b"
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
