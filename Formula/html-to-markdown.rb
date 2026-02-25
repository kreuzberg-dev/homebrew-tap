class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.25.2.tar.gz"
  sha256 "7b6605330e12098973b5d79fc886b6faa9de419541281d5f366fc769132cf01e"
  license "MIT"



















































  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.25.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1874b7945b6da17ef574f97bca006a3290b81e662dfbc78b0af71fd82a238a38"
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
