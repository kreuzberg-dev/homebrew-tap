class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.27.1.tar.gz"
  sha256 "b6208a4721cd7c6cc5770dca7d6ea7839eddcc7f2b01e06add7711e1fbf8e379"
  license "MIT"






























































  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.27.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9f78d6728a31bac3101861e523feb45b77ca41b50f5f1402ce52a3942ebd8853"
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
