class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.22.4.tar.gz"
  sha256 "d0f011800774dac045b42d8c145709bc865c6f3fa107ffc650d2a9c20c04b896"
  license "MIT"















  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.22.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "209cbcee8b878ac14425ef769f964f7d08abb12d7c1ec98ccfae252a516bafdd"
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
