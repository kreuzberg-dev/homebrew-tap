class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.29.0.tar.gz"
  sha256 "c943af088a434422e0ea78c971d2d57d33ea7c16e3820240d52c4be4ce205594"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.29.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "59936ac63de311577835048d3565fb708518c6a6532be08795de3826066153b0"
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
