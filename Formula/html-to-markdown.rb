class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.28.0.tar.gz"
  sha256 "138e62e26d660a7b3196b726b0dbcc2ad20555b1ab3f0bc311f317abea78cb87"
  license "MIT"


































































  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.28.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0bbafa67fcc8e3d2012921eeaf481ca3b61c591aeb19dcb53bb2ec409627346c"
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
