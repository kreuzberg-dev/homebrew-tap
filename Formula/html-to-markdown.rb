class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.19.4.tar.gz"
  sha256 "d1b062a6b3b27ce65b88062479f316c3a1e61445532abe5af9be029ed5de377f"
  license "MIT"


  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.19.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "120aaccf9f64d5ef46642400a64c0a22c79be08bfa4eb2b22a6dac61de6c1d15"
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
