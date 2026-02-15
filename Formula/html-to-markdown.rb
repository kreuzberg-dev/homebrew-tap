class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.25.0.tar.gz"
  sha256 "99659ee186996ff5d67b6650034ee85c3299184b2507067202342c32d8258f16"
  license "MIT"















































  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.25.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0e9589871d539648b8314cbd5cf080935ab6e8a5fb7b1baac4d8a90420d85e76"
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
