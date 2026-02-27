class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.26.1.tar.gz"
  sha256 "d86caaa024b3ee1dc7f8157f02caf661e78c6569c7a7a6b20b92ded55ef6c0cd"
  license "MIT"

























































  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.26.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "44e90ee18e3055cce91e83f395674329c5f0122dbadf090ed8d5010033ba922a"
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
