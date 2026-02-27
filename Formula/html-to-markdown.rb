class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.26.1.tar.gz"
  sha256 "eeec87f76043fd615e6ca52426ed55339b71e5dbd917081beaec31a80f11dc2a"
  license "MIT"


























































  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.26.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "137bfa2e98542efbf8fec4d16bbdf7ad6c964ae9d861e884dba2e9011d03337a"
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
