class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.24.4.tar.gz"
  sha256 "8a8dd4c979a972e162c3b6e8c34e19c3d817e16cd04ce48ad8790f421a4a505f"
  license "MIT"











































  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.24.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "84fdf14c7e47c6d2e7f81091fe6a70c4f3c03da01ff5a45ae91ad4b902c238c6"
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
