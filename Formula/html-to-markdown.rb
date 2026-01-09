class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.20.1.tar.gz"
  sha256 "b3f05625a7f38dea3d690236b89cc03966b86f649d6019b42d60fa7465ff8267"
  license "MIT"







  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.20.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f43e303c996559f5d93331ca98eee2110901e108d46efbe6e77a76f50015e9cc"
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
