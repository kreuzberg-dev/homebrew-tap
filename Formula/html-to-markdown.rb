class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.28.1.tar.gz"
  sha256 "8452e7f1ebc17781d8e4ef5fb61088cbd3b75559634e83470dda8feaa335c3c3"
  license "MIT"








































































  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.28.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "57487662f89b5d3abd0ec6c07767086ed706e23587a51788831f45990695409c"
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
