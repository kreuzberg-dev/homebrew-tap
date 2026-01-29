class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.24.1.tar.gz"
  sha256 "bf66011f5244c14dbef1c3cdc792d6bb9d23133a557da0cf0f412ded39048278"
  license "MIT"






































  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.24.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7b5c6fb8db229d5e0b059c15d0053c6e23df02d56c33c743219f76771586948a"
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
