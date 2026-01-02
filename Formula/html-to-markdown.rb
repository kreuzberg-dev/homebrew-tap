class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.19.3.tar.gz"
  sha256 "1cc77fe792519ccfe8e2b0252a4d43ea4393548d8d54959c436d9da5c139820d"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.19.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "49ae799dd6c45cad42da812b9cd15ff499403b7d757269942533c0a3f6c35bf2"
  end

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.19.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d7ea21bfe856a563baeda32ef101b47a0451151e4dd26ae23c1fdfb9f699893f"
  end

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.19.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5fb840d3b171e0df48cfc814214596beb7f27946d20f49f4bb80a1daeb54df3a"
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
