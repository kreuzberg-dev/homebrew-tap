class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.23.0.tar.gz"
  sha256 "ae327efad67c62de812bb807ebb68e9e6777a500cba2d5def264f9be156fe212"
  license "MIT"


























  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.23.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "99873e0387cc3f631f48ed9fecd5ae8839e641add03b1ec2a1afea1de62fd9ac"
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
