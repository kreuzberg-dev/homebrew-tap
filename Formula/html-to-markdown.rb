class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.24.6.tar.gz"
  sha256 "91e5d996f4b3276c9c015bb7c170833a73d9b6bfba96d36998d4408d7a6d7ce6"
  license "MIT"














































  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.24.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a760d2129a4cd5477e11cad8b98fc807f1d9b10f8f4cbd469cfbb74d49f7a56c"
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
