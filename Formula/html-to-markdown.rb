class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.22.6.tar.gz"
  sha256 "986aa79beee24f9291ef83ea08c1c2ce5a79920e356cfce5a5c5a2cfab822100"
  license "MIT"


















  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.22.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ab9070f586e617c262327991d2fcddff401aac4c85ce5d0d86efa5a40b864a16"
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
