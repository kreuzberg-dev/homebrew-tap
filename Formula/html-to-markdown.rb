class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  url "https://github.com/kreuzberg-dev/html-to-markdown/archive/v2.22.0.tar.gz"
  sha256 "8a95cfafe4ec69a521cdf31ac0e42f86203c89a7ed55bdd630daf062b5f4278f"
  license "MIT"











  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v2.22.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7051a4b93a9245ffb76a807cd090cda5a057171b9ababbb00c88f135b5a0a214"
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
